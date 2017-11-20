# amdgpocl
OpenCL on amdgpu for Arch, also in the [AUR](https://aur.archlinux.org/packages/opencl-amd/)

This package allows the usage of AMD's proprietary user-space OpenCL driver along with the free amdgpu stack. It should work with upstream amdgpu and Mesa. Inspired by [this blog post]( https://web.archive.org/web/20160609211126/http://www.gearsongallium.com/?p=2960).

## Hardware support

This *should* work with all amdgpu-enabled GCN GPUs. However, I have no hardware to actually test it.

If you are using SI (Southerin Islands) or CIK (Sea Islands GPU), you'll need to enable the *amdgpu* and disable the *radeon* kernel module. Check the [Arch Wiki]( https://wiki.archlinux.org/index.php/AMDGPU#Enable_Southern_Islands_.28SI.29_and_Sea_Islands_.28CIK.29_support) for the exact steps.

Currently tested with Kernel 4.13 and Hawaii. Blender Cycles and Luxmark seem to work without any problems.

## What this is not

You are not getting Vulkan support, faster 3D rendering or unicorns.

If you are looking for the full amdgpu-pro stack, including proprietary OpenGL and Vulkan implementations, move over to the [aur](https://aur.archlinux.org/packages/?K=amdgpu).

Expect maintainance of this package to be dropped when there is free OpenCL support on top of the [ROC]( https://rocm.github.io/) stack.
