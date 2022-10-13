#!/usr/bin/env bash
set -e
virtualenv ".venv" -p python3
. ".venv/bin/activate"
echo "Installing autobuild..."
pip install --upgrade certifi --quiet
pip3 install --upgrade llbase --quiet
if command -v autobuild >/dev/null 2>&1 && [[ "$(autobuild --version)" == "autobuild 9.0.0" ]]; then
	pip3 uninstall --yes autobuild --quiet
fi
pip3 install --no-cache --upgrade autobuild --quiet

# we have a lot of files, relax ulimit to help performance
ulimit -n 20000
build_jobs=$(nproc)
if [[ ${build_jobs} -gt 1 ]]; then
	# The viewer requires an average of 4GB of memory per core to link
	mempercorekb=$((4 * 1048576))
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
			while [[ $((jobs * mempercorekb)) -lt ${freememorykb} ]]; do
				jobs=$((jobs+1))
				echo -e "${jobs}...$(((jobs * mempercorekb)/1024/1024))GB"
			done
			build_jobs=${jobs}
		fi
	fi
fi
if pacman -Qq ccache &> /dev/null; then
	export PATH="/usr/lib/ccache/bin/:$PATH"
	export CCACHE_SLOPPINESS="file_macro,locale,time_macros"
	export CCACHE_NOHASHDIR="true"
fi
export AUTOBUILD_CPU_COUNT=$build_jobs
schedtool -B -n 1 -e ionice -n 1 autobuild configure -A 64 -c ReleaseOS -- \
	-DLL_TESTS:BOOL=OFF \
	-DDISABLE_FATAL_WARNINGS=ON \
	-DUSE_LTO:BOOL=OFF \
	-DDCMAKE_CXX_FLAGS="-march=x86-64-v2 -mtune=native" \
	-DVIEWER_CHANNEL="Alchemy Test"

echo "Building with ${AUTOBUILD_CPU_COUNT} jobs (adjusted)"
schedtool -B -n 1 -e ionice -n 1 autobuild build -A64 -c ReleaseOS --no-configure
