#!/usr/bin/env bash
set -e

if command -v schedtool >/dev/null 2>&1; then
	# Set current shell and all descendents as SCHED_BATCH, see schedtool(8)
	schedtool -B $$
	prefix_cmd='schedtool -B -n20 -e '
fi

venv() {
	virtualenv ".venv" -p python3
	. ".venv/bin/activate"
}

prepare() {
	if [[ -n "$USE_VENV" ]]; then
		venv
	fi
	echo "Installing autobuild..."
	pip install --upgrade certifi --quiet
	pip3 install --upgrade llbase --quiet
	if command -v autobuild >/dev/null 2>&1 && [[ "$(autobuild --version)" == "autobuild 9.0.0" ]]; then
		pip3 uninstall --yes autobuild --quiet
	fi
	pip3 install --no-cache --upgrade autobuild --quiet
}

build() {
	# we have a lot of files, relax ulimit to help performance
	if [[ -n "$USE_VENV" ]]; then
		. ".venv/bin/activate"
	fi
	ulimit -n 20000
	build_jobs=$(nproc)
	if [[ ${build_jobs} -gt 1 ]]; then
		mempercorekb=$((4 * 1048576))
		# The viewer requires an average of 4GB of memory per core to link
		requiredmemorykb=$(($(nproc) * mempercorekb))
		# Source: Total Used Free
		free_output="$(free --kilo --total | tr -s ' ')"
		totalmemorykb=$(grep Total <<< "$free_output" | cut -d ' ' -f 2)
		freememorykb=$(grep Total <<< "$free_output" | cut -d ' ' -f 4)
		#echo "Total memory:    $totalmemorykb (includes swap)"
		#echo "Free memory:     $freememorykb"
		#echo "Required memory: $requiredmemorykb"
		if [[ ${requiredmemorykb} -gt ${totalmemorykb} ]]; then
			echo "Not enough physical memory to build with all cores, adjusting"
			echo "Estimated required memory to build with all cores: $((requiredmemorykb/1024/1024)) GB"
			if [[ ${requiredmemorykb} -gt ${freememorykb} ]]; then
				jobs=1
				echo "Allocating build jobs according to available memory (${freememorykb}/${requiredmemorykb})..."
				# FIXME: Goes one iteration beyond what it should
				while [[ $((jobs * mempercorekb)) -lt ${freememorykb} ]]; do
					jobs=$((jobs+1))
					echo -e "${jobs}...$(((jobs * mempercorekb)/1024/1024))GB"
				done
				build_jobs=${jobs}
				echo "Computed job count: ${build_jobs}"
			fi
		fi
	fi
	export AUTOBUILD_CPU_COUNT=$build_jobs

	AL_ARCH_FLAGS=${AL_ARCH_FLAGS:-'-march=x86-64-v2 -mtune=native -w'}
	AL_CMAKE_CONFIG=(
		-DLL_TESTS:BOOL=OFF
		-DDISABLE_FATAL_WARNINGS=ON
		-DUSE_LTO:BOOL=OFF
		-DVIEWER_CHANNEL="Alchemy Test"
		-DCMAKE_C_FLAGS="$AL_ARCH_FLAGS"
		-DCMAKE_CXX_FLAGS="$AL_ARCH_FLAGS"
		)
	# I could not find the documentation on how to handle BUILDENV/OPTION in
	# makepkg.conf. If you are reading this and know where it is,
	# please send it my way.
	if [[ -n "$AL_NO_CCACHE" ]] || ! command -v ccache 2 > /dev/null 2>&1; then
		echo "ccache disabled"
		AL_CMAKE_CONFIG+=(-UCMAKE_CXX_COMPILER_LAUNCHER)
	else
		echo "ccache available and enabled"
		export CCACHE_SLOPPINESS="file_macro,locale,time_macros"
		export CCACHE_NOHASHDIR="true"
		AL_CMAKE_CONFIG+=(-DCMAKE_CXX_COMPILER_LAUNCHER=ccache)
	fi
	$prefix_cmd autobuild configure -A 64 -c ReleaseOS -- "${AL_CMAKE_CONFIG[@]}"

	echo "Building with ${AUTOBUILD_CPU_COUNT} jobs (adjusted)"
	$prefix_cmd autobuild build -A64 -c ReleaseOS --no-configure
}
if [[ -n "$1" ]]; then
	$1
else
	echo "Running unattended batch build..."
	prepare
	build
fi
