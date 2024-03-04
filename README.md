# glfw-wayland
A GLFW Fork that runs on Wayland Natively over X11 with more compatible features just to play Minecraft.

**NOTE: Only work for LWJGL3 just because LWJGL2 doesn't use GLFW in the first place.**
And yes, this is Linux only because duh...

## Initial Setup

Clone this repository. Once you've cloned it, you can setup the patches:
```bash
git clone https://github.com/BoyOrigin/glfw-wayland.git
cd glfw-wayland
./applyPatches.sh
```

This will set up the entire project, as once it's done everything will be ready to go!

## Compiling

In order to build glfw, same guide from the [compilation guide](https://www.glfw.org/docs/latest/compile.html) still applied to this.

## Use it on Minecraft

In order to use it on Minecraft, just add this to your VM options.
`-Dorg.lwjgl.glfw.libname=/your_download_path/libglfw.so.3.4`

The shared library is downloadable from our [release page](https://github.com/BoyOrigin/glfw-wayland/releases)