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

	echo "Installing build toolchain..."
	pip3 install --upgrade certifi --quiet
	pip3 install --upgrade llbase --quiet
	pip3 install --no-cache --upgrade autobuild --quiet
	pip3 install --upgrade cmake ninja
}

build() {
	# we have a lot of files, relax ulimit to help performance
	if [[ -n "$USE_VENV" ]]; then
		. ".venv/bin/activate"
	fi
	set +e
	ulimit -n 20000
	set -e
	build_jobs=$(nproc)
	if [[ -z "$NO_SMART_JOB_COUNT" ]]; then
		if [[ ${build_jobs} -gt 1 ]]; then
			jobs=1
			# The viewer requires an average of 2GB of memory per core to link
			# Note: Behaviour change compared to the previous versions:
			# This script will no longer try to allocate build memory into swap
			# This is bad practice, and swap should be reserved to evict process
			# memory from physical ram to make place for the current workset.
			# This script will now try to check if swap is present and sufficent
			# for the current used memory to be stored in swap before allocating,
			# and will fallback to conservative allocation if swap is not available
			gigperlinkprocess=2
			mempercorekb=$((gigperlinkprocess * 1048576))
			requiredmemorykb=$(($(nproc) * mempercorekb))
			free_output="$(free --kilo --total | tail -n+2 | tr -s ' ')"
			physical_output=$(grep "Mem:" <<<"$free_output")
			#total_output=$(grep Total: <<< "$free_output")
			usedmemorykbphysical=$(cut -d ' ' -f 3 <<<"$physical_output")
			totalmemorykbphysical=$(cut -d ' ' -f 2 <<<"$physical_output")
			swap_output=$(grep Swap: <<<"$free_output")
			# Determine available swap space
			availableswapkb=0
			if [[ -n "$swap_output" ]]; then
				availableswapkb=$(cut -d ' ' -f 4 <<<"$swap_output")
			fi
			availablememorykbphysical=$(cut -d ' ' -f 7 <<<"$free_output")
			echo "Total memory:         $totalmemorykbphysical (includes swap)"
			echo "Available memory:     $availablememorykbphysical"
			echo "Required memory:      $requiredmemorykb"
			echo "Available physical memory on this system: $((availablememorykbphysical / 1024 / 1024)) GB"
			echo "Estimated required memory to build with all cores: $((requiredmemorykb / 1024 / 1024)) GB"
			if [[ ${requiredmemorykb} -gt ${availablememorykbphysical} ]]; then
				echo "Warning: Not enough available physical memory to build with all cores"
				if [[ ${usedmemorykbphysical} -lt ${availableswapkb} ]]; then
					# use all physical ram as swap will do its job
					echo "There is enough free swap to store the currently used memory"
					jobs=$(((totalmemorykbphysical / 1024 / 1024) / gigperlinkprocess))
				else
					# Not enough swap to hold ram contents, calculate manually
					echo "Allocating build jobs according to available physical memory ("$((availablememorykbphysical / 1024 / 1024))"/"$((requiredmemorykb / 1024 / 1024))"GB)..."
					# FIXME: Goes one iteration beyond what it should
					while [[ $((jobs * mempercorekb)) -lt ${availablememorykbphysical} ]]; do
						jobs=$((jobs + 1))
						echo -e "${jobs} jobs would consume $(((jobs * mempercorekb) / 1024 / 1024))GB"
					done
					# Back off one job count. Not sure why I have to do this but
					# the loop is doing one extra iteration.
					jobs=$((jobs - 1))
				fi
				build_jobs=${jobs}
				echo "Computed job count: ${build_jobs}"
			fi
		fi
	fi
	export AUTOBUILD_CPU_COUNT=$build_jobs
	AL_CMAKE_CONFIG=(
		-DLL_TESTS:BOOL=ON
		-DDISABLE_FATAL_WARNINGS=ON
		-DUSE_LTO:BOOL=OFF
		-DVIEWER_CHANNEL="Alchemy Test"
	)
	# I could not find the documentation on how to handle BUILDENV/OPTION in
	# makepkg.conf. If you are reading this and know where it is,
	# please send it my way.
	# if [[ -n "$AL_NO_CCACHE" ]] || ! command -v ccache 2 > /dev/null 2>&1; then
	# echo "ccache disabled"
	# AL_CMAKE_CONFIG+=(-UCMAKE_CXX_COMPILER_LAUNCHER)
	# else
	# echo "ccache available and enabled"
	# export CCACHE_SLOPPINESS="file_macro,locale,time_macros"
	# export CCACHE_NOHASHDIR="true"
	# AL_CMAKE_CONFIG+=(-DCMAKE_CXX_COMPILER_LAUNCHER=ccache)
	# fi
	$prefix_cmd autobuild configure -A 64 -c ReleaseOS -- "${AL_CMAKE_CONFIG[@]}"
	echo "Building with ${AUTOBUILD_CPU_COUNT} jobs (adjusted)"
	$prefix_cmd autobuild build -A64 -c ReleaseOS --no-configure
}

cleanbuild() {
	rm -rf build-linux-64
	git pull --prune
	build
}
if [[ -n "$1" ]]; then
	$1
else
	echo "Running unattended batch build..."
	prepare
	build
fi

# vi: set ai softtabstop=2 shiftwidth=2 tabstop=2 expandtab:
