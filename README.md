# amdgpocl
OpenCL on amdgpu for Arch, also in the [AUR].

This package allows the usage of AMD's proprietary user-space OpenCL driver along with the free amdgpu stack. It should work with upstream amdgpu and Mesa. Inspired by [this blog post][gog].

## Hardware support

This *should* work with amdgpu-enabled GCN GPUs. Newer GPUs, starting with Vega (GCN Gen. 5+), support OpenCL via [PAL] and might work since commit [f5838ef] too, however I don't have the hardware to test it.

If you are using SI (Southern Islands, GCN Gen. 1) or CIK (Sea Islands, GCN Gen. 2), you'll need to enable the *amdgpu* and disable the *radeon* kernel module. Check the [Arch Wiki] for the exact steps.

Currently tested with Kernel 4.16 and Hawaii. Blender Cycles, Luxmark, F@H and ethminer seem to work without any problems.

## What this is not

You are not getting Vulkan support, faster 3D rendering or unicorns.

If you are looking for the full amdgpu-pro stack, including proprietary OpenGL and Vulkan implementations, move over to the [AUR][AUR-AMDGPU].

Expect maintenance of this package to be dropped when there is free OpenCL support on top of the [ROC] stack or the [PAL].

[AUR]: https://aur.archlinux.org/packages/opencl-amd/
[AUR-AMDGPU]: https://aur.archlinux.org/packages/?K=amdgpu
[Arch Wiki]: https://wiki.archlinux.org/index.php/AMDGPU#Enable_Southern_Islands_.28SI.29_and_Sea_Islands_.28CIK.29_support
[gog]: https://web.archive.org/web/20160609211126/http://www.gearsongallium.com/?p=2960
[ROC]: https://rocm.github.io/
[PAL]: https://github.com/GPUOpen-Drivers/pal
[f5838ef]: https://github.com/grmat/opencl-amd/commit/f5838ef8d0ab51b063b668c303c34095f9d10938
