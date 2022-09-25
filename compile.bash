#!/usr/bin/env bash
set -e
# workaround for broken venv/autobuild
virtualenv ".venv" -p python3
. ".venv/bin/activate"
pip install --upgrade certifi
#if command -v autobuild && \
#	[ "$(autobuild --version | cut -d ' ' -f 2 | tr -d '.')" -gt 210 ]
#then
#	echo "Found Autobuild"
#else
	pip3 install --upgrade llbase
	# pip3 uninstall autobuild --yes
	pip3 install --no-cache-dir --upgrade autobuild -i \
		https://git.alchemyviewer.org/api/v4/projects/54/packages/pypi/simple \
		--extra-index-url https://pypi.org/simple
#fi
# we have a lot of files, relax ulimit to help performance
ulimit -n 20000
# shellcheck disable=SC2153
# LTO is currently very broken for alchemy
#autobuild configure -A 64 -c ReleaseOS -- \
#	-DLL_TESTS:BOOL=OFF \
#	-DDISABLE_FATAL_WARNINGS=ON \
#	-DUSE_LTO:BOOL="$(grep -cq '[^!]lto' <<< "${1}" && echo 'ON' || echo 'OFF')" \
#	-DVIEWER_CHANNEL="Alchemy Test"
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
autobuild build -A64 -c ReleaseOS --no-configure