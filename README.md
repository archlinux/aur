# amdgpocl
OpenCL on amdgpu for Arch, also in the [AUR].

This package allows the usage of AMD's proprietary user-space OpenCL driver along with the free amdgpu stack. It should work with upstream amdgpu and Mesa. Inspired by [this blog post][gog].

## Hardware support

This *should* work with amdgpu-enabled GCN GPUs up to Polaris (GCN Gen. 4). Newer GPUs, starting with Vega (GCN Gen. 5+), are only supported via [ROC].

If you are using SI (Southern Islands, GCN Gen. 1) or CIK (Sea Islands, GCN Gen. 2), you'll need to enable the *amdgpu* and disable the *radeon* kernel module. Check the [Arch Wiki] for the exact steps.

Currently tested with Kernel 4.14 and Hawaii. Blender Cycles, Luxmark, F@H and ethminer seem to work without any problems.

## What this is not

You are not getting Vulkan support, faster 3D rendering or unicorns.

If you are looking for the full amdgpu-pro stack, including proprietary OpenGL and Vulkan implementations, move over to the [AUR][AUR-AMDGPU].

Expect maintainance of this package to be dropped when there is free OpenCL support on top of the [ROC] stack.

[AUR]: https://aur.archlinux.org/packages/opencl-amd/
[AUR-AMDGPU]: https://aur.archlinux.org/packages/?K=amdgpu
[Arch Wiki]: https://wiki.archlinux.org/index.php/AMDGPU#Enable_Southern_Islands_.28SI.29_and_Sea_Islands_.28CIK.29_support
[gog]: https://web.archive.org/web/20160609211126/http://www.gearsongallium.com/?p=2960
[ROC]: https://rocm.github.io/
