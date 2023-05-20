# ARCH-Linux - AUR - Package python-torchvision-rocm

Either build from source, or add

https://github.com/arch4edu/arch4edu

to your package sources, they have (upon other packages)

a prebuild python-torchvision-rocm binary build from this source available.

- This **usually** works for manjaro too
    - with minor issues after major library updates that will come with a delay to manjaro

### Runing pytorch/torchvision on an old/custom build ROCM stack

The whole ROCM stack is now (since Jan.2023) in archlinux and manjaro,
if you run into trouble with newer pytorch versions,
you should uninstall **all** ROCM related custom build packages
and reinstall python-pytorch-rocm to get the integrated packages from your distro.
