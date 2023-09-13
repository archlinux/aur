# GLFW for Minecraft using Wayland

This package allows Minecraft to run on Wayland by patching GLFW to not crash when calling unimplemented methods used by Minecraft.

## How to use

### Arch Linux

Install the `glfw-git-minecraft` package from the AUR.

### Other distros

1. Clone the [GLFW repository](https://github.com/glfw/glfw).
2. Apply the patches from this repository:
    ```sh
    git apply --directory=glfw/ --ignore-space-change --ignore-whitespace --reject --verbose -- *.patch
    ```
3. Build and install GLFW as usual.

## Acknowledgements

- [glfw-minecraft-wayland](https://github.com/Admicos/minecraft-wayland) by [Admicos](https://github.com/Admicos) for the original patch.
- [glfw-git](https://aur.archlinux.org/packages/glfw-git) for the original Arch Linux package.