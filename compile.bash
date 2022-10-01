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
AUTOBUILD_CPU_COUNT=$(nproc)
if [[ ${AUTOBUILD_CPU_COUNT} -gt 1 ]]; then
	#if false; then
		# The viewer requires an average of 4GB of memory per core to link
		mempercorekb=$((4 * 1048576))
		requiredmemorykb=$(($(nproc) * mempercorekb))
		availablememorykb=$(grep MemTotal /proc/meminfo|tr -s ' '|cut -d ' ' -f 2)
		#freememkb="$(grep MemFree /proc/meminfo | tr -s ' ' | cut -d ' ' -f 2)"
		if [[ ${requiredmemorykb} -gt ${availablememorykb} ]]; then
			jobs=0
      until [[ $(((jobs + 1) * mempercorekb)) -gt ${availablememorykb} ]]; do
				jobs=$((jobs+1))
      done
      #((jobs--))
      AUTOBUILD_CPU_COUNT=${jobs}
	#fi
		elif [[ ${AUTOBUILD_CPU_COUNT} -le 8 ]]; then
			AUTOBUILD_CPU_COUNT=$((AUTOBUILD_CPU_COUNT - 1))
		else
			AUTOBUILD_CPU_COUNT=$((AUTOBUILD_CPU_COUNT - 2))
		fi
fi
export AUTOBUILD_CPU_COUNT
autobuild configure -A 64 -c ReleaseOS -- \
	-DLL_TESTS:BOOL=OFF \
	-DDISABLE_FATAL_WARNINGS=ON \
	-DUSE_LTO:BOOL=OFF \
	-DVIEWER_CHANNEL="Alchemy Test"

echo "Building with ${AUTOBUILD_CPU_COUNT} jobs (adjusted)"
# job count is not overrideable...
#autobuild build -A64 -c ReleaseOS --no-configure
cd build-linux-64
ninja -j${AUTOBUILD_CPU_COUNT}
