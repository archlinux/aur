#!/bin/bash

function bindNvidia() {
	mod=$(lsmod)
	if [[ ${mod} =~ xe ]] || [[ ${mod} =~ amdgpu ]] || [[ ${mod} =~ i915 ]]; then
		bwExtraPar=""
	else
		echo "[Info] NVIDIA device bound"
		bwExtraPar="--dev-bind /dev /dev"
# 		for device in $(ls /dev/ | grep nvidia); do
# 			bwExtraPar="${bwExtraPar} --dev-bind-try /dev/${device} /dev/${device}"
# 		done
# 		echo "[Debug]: parm ${bwExtraPar}"
	fi
}

function launchV2() {
	mod=$(lsmod)
	if [[ ${mod} =~ xe ]] || [[ ${mod} =~ amdgpu ]] || [[ ${mod} =~ i915 ]]; then
		bwrap \
			--dev-bind / / \
			--dev /dev \
			--dev-bind /dev/dri /dev/dri \
			--dev-bind /dev/shm /dev/shm \
			--dev-bind /dev/input /dev/input \
			${bwExtraPar} \
			-- /usr/bin/env -u DISPLAY wiliwili "$@"
	else
		echo "[Info] NVIDIA device bound"
		/usr/bin/env -u DISPLAY wiliwili "$@"
	fi

}

launchV2 $@
