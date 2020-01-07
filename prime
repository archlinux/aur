#!/bin/bash

case "$@" in
	""|"--help"|"-help"|"-h")
		echo "
This script only launches the command you write after.
Example:
	prime glxinfo | grep OpenGL
It should show you video driver in use."
exit 0
esac

__NV_PRIME_RENDER_OFFLOAD=1 __NV_PRIME_RENDER_OFFLOAD_PROVIDER="NVIDIA-G0" __GLX_VENDOR_LIBRARY_NAME="nvidia" __VK_LAYER_NV_optimus="NVIDIA_only" exec "$@"
