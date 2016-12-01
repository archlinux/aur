# amdgpocl
OpenCL on amdgpu for Arch, also in the [AUR](https://aur.archlinux.org/packages/opencl-amd/)

This package allows the usage of AMD's proprietary user-space OpenCL driver along with the free amdgpu stack. It should work with upstream amdgpu and Mesa. Inspired by [this blog post](http://www.gearsongallium.com/?p=2960).

## Hardware support

This *should* work with all amdgpu-enabled GCN GPUs. However, I have no hardware to actually test it.

If you are using CIK (Sea Islands GPU), you'll need a custom kernel. Check the [aur](https://aur.archlinux.org/packages/linux-cik/) or compile your own.

Currently tested with Kernel 4.8.6 and Hawaii. Blender Cycles and Luxmark seem to work without any problems.

## What this is not

You are not getting Vulkan support, faster 3D rendering or unicorns.

If you are looking for the full amdgpu-pro stack, including proprietary OpenGL and Vulkan implementations, move over to the [aur](https://aur.archlinux.org/pkgbase/amdgpu-pro-installer/).

Expect maintainance of this package to be dropped when there is free OpenCL support on top of the [ROC](https://radeonopencompute.github.io/) stack.
