#Maintainer:  sparzz
pkgname=radv-git
packager=sparzz
pkgver=20.2.0_devel.2020.06.08_r1
pkgrel=1
epoch=
pkgdesc="Provide mesa RADV drivers for AMD card . Update with yay -Sua. If you want to enable th ACO compiler go to your .bashrc file and add this line : export RADV_PERFTEST=aco. It provide the most recent Vulkan API. "
arch=(x86_64)
url="https://github.com/mesa3d/mesa"
license=('MIT')
groups=()
depends=("spirv-tools"
         "mesa"
         "mesa-demos"
         "mesa-vdpau"
         "lib32-mesa"
         "lib32-mesa-demos"
         "lib32-mesa-vdpau"
         "lib32-opencl-mesa"
         "libva-mesa-driver"
         "opencl-mesa"
         "vdpauinfo"
         "lib32-libva-vdpau-driver"
         "lib32-libvdpau"
         "libva-vdpau-driver"
         "libvdpau"
         "libxvmc"
         "lib32-libxvmc"
         "libxv"
         "lib32-libxv"
         "libva"
         "libva-intel-driver"
         "libva-utils"
         "libva1"
         "libva1-intel-driver"
         "lib32-libva"
         "lib32-libva-intel-driver"
         "lib32-libva1"
         "lib32-libva1-intel-driver"
         "lib32-lm_sensors"
         "lm_sensors"
         "qt5-sensors"
         "indicator-sensors"
         "lib32-libdrm"
         "libdrm"
         "faac"
         "faad2"
         "libelf"
         "lib32-libelf"
         "valgrind"
         "bison"
         "flex"
         "lib32-flex"
         "libunwind"
         "lib32-libunwind"
         "wayland"
         "wayland-protocols"
         "lib32-wayland"
         "qt5-wayland"
         "lib32-libx11"
         "libx11"
         "libxkbcommon-x11"
         "qt5-x11extras"
         "lib32-libxext"
         "libxext"
         "lib32-libxdamage"
         "libxdamage"
         "lib32-libxfixes"
         "libxfixes"
         "libxcb"
         "lib32-libxcb"
         "xcb-proto"
         "xcb-util"
         "xcb-util-cursor"
         "xcb-util-image"
         "xcb-util-keysyms"
         "xcb-util-renderutil"
         "xcb-util-wm"
         "libxshmfence"
         "lib32-libxshmfence"
         "glew"
         "glib2"
         "glibc"
         "glslang"
         "glu"
         "gl2ps"
         "libxxf86vm"
         "lib32-libxxf86vm"
         "lib32-libxrandr"
         "libxrandr"
         "xorg-xrandr"
         "opencl-headers"
         "python-evdev"
         "yay")
makedepends=("meson"
            "ninja"
            "git"
            "ninjas2"
            "cmake"
            "make"
            "extra-cmake-modules"
            "samurai"
            "llvm"
            "llvm-libs"
            "lib32-llvm"
            "lib32-llvm-libs"
            "vulkan-extra-layers"
            "vulkan-headers"
            "vulkan-icd-loader"
            "vulkan-validation-layers"
            "lib32-vulkan-icd-loader"
            "lib32-vulkan-validation-layers"
            "python"
            "python-appdirs"
            "python-mako")
checkdepends=()
optdepends=()
provides=(radv-git)
conflicts=(mesa-radv-drivers-git)
conflicts=(radv-aco-git)
replaces=(mesa-radv-drivers-git)
replaces=(radv-aco-git)
backup=()
options=()
install=
changelog=
source=("mesa::git+https://github.com/mesa3d/mesa.git")
noextract=()
md5sums=("SKIP")
validpgpkeys=()

prepare() {

    # little patch to remove unwanted backup file created by the build
    # wil investigate for that soon 

	cd /usr/local/lib
	
	if dir libEGL.so.1.0.0.old; then 
	sudo rm -r libEGL.so.1.0.0.old
	fi
	
	if dir libEGL.so.1.old; then 
	sudo rm -r libEGL.so.1.old
	fi
	
	if dir libEGL.so.old; then 
	sudo rm -r libEGL.so.old
	fi
	
	if dir libgbm.so.1.0.0.old; then
	sudo rm -r libgbm.so.1.0.0.old
	fi
	
	if dir libgbm.so.1.old; then
	sudo rm -r libgbm.so.1.old
	fi
	
	if dir libgbm.so.old; then
	sudo rm -r libgbm.so.old
	fi
	
	if dir libGL.so.1.2.0.old; then
	sudo rm -r libGL.so.1.2.0.old
	fi
	
	if dir libGL.so.1.old; then 
	sudo rm -r libGL.so.1.old
	fi 
	
	if dir libGL.so.old; then 
	sudo rm -r libGL.so.old
	fi
	
	if dir libglapi.so.0.0.0.old; then
	sudo rm -r libglapi.so.0.0.0.old
	fi
	
	if dir libglapi.so.0.old; then 
	sudo rm -r libglapi.so.0.old
	fi
	
	if dir libglapi.so.old; then
	sudo rm -r libglapi.so.old
	fi
	
	if dir libGLESv1_CM.so.1.1.0.old; then 
	sudo rm -r libGLESv1_CM.so.1.1.0.old
	fi
	
	if dir libGLESv1_CM.so.1.old; then
	sudo rm -r libGLESv1_CM.so.1.old
	fi
	
	if dir libGLESv1_CM.so.old; then
	sudo rm -r libGLESv1_CM.so.old
	fi
	
	if dir libGLESv2.so.2.0.0.old; then 
	sudo rm -r libGLESv2.so.2.0.0.old
	fi
	
	if dir libGLESv2.so.2.old; then 
	sudo rm -r libGLESv2.so.2.old
	fi
	
	if dir libGLESv2.so.old; then 
	sudo rm -r libGLESv2.so.old
	fi
	
	if dir libvulkan_intel.so.old; then 
	sudo rm -r libvulkan_intel.so.old
	fi
	
	if dir libvulkan_radeon.so.old; then
	sudo rm -r libvulkan_radeon.so.old
	fi
	
	if dir libxatracker.so.2.5.0.old; then
	sudo rm -r libxatracker.so.2.5.0.old
	fi
	
	if dir libxatracker.so.2.old; then 
	sudo rm -r libxatracker.so.2.old
	fi
	
	if dir libxatracker.so.old; then
	sudo rm -r libxatracker.so.old
	fi
	
	if dir libXvMCnouveau.so.old; then
	sudo rm -r libXvMCnouveau.so.old
	fi
	
	if dir libXvMCr600.so.old; then 
	sudo rm -r libXvMCr600.so.old
	fi
}


build() {
	cd mesa
	mkdir build
	sudo meson build/
}



package() {
	sudo DESTDIR="$pkgdir" ninja $NINJAFLAGS -C mesa/build/ install 
	
	# little patch to remove backup files created by the build
	# will investigate for that soon
	
	
	cd /usr/local/lib
	
	if dir libEGL.so.1.0.0.old; then 
	sudo rm -r libEGL.so.1.0.0.old
	fi
	
	if dir libEGL.so.1.old; then 
	sudo rm -r libEGL.so.1.old
	fi
	
	if dir libEGL.so.old; then 
	sudo rm -r libEGL.so.old
	fi
	
	if dir libgbm.so.1.0.0.old; then
	sudo rm -r libgbm.so.1.0.0.old
	fi
	
	if dir libgbm.so.1.old; then
	sudo rm -r libgbm.so.1.old
	fi
	
	if dir libgbm.so.old; then
	sudo rm -r libgbm.so.old
	fi
	
	if dir libGL.so.1.2.0.old; then
	sudo rm -r libGL.so.1.2.0.old
	fi
	
	if dir libGL.so.1.old; then 
	sudo rm -r libGL.so.1.old
	fi 
	
	if dir libGL.so.old; then 
	sudo rm -r libGL.so.old
	fi
	
	if dir libglapi.so.0.0.0.old; then
	sudo rm -r libglapi.so.0.0.0.old
	fi
	
	if dir libglapi.so.0.old; then 
	sudo rm -r libglapi.so.0.old
	fi
	
	if dir libglapi.so.old; then
	sudo rm -r libglapi.so.old
	fi
	
	if dir libGLESv1_CM.so.1.1.0.old; then 
	sudo rm -r libGLESv1_CM.so.1.1.0.old
	fi
	
	if dir libGLESv1_CM.so.1.old; then
	sudo rm -r libGLESv1_CM.so.1.old
	fi
	
	if dir libGLESv1_CM.so.old; then
	sudo rm -r libGLESv1_CM.so.old
	fi
	
	if dir libGLESv2.so.2.0.0.old; then 
	sudo rm -r libGLESv2.so.2.0.0.old
	fi
	
	if dir libGLESv2.so.2.old; then 
	sudo rm -r libGLESv2.so.2.old
	fi
	
	if dir libGLESv2.so.old; then 
	sudo rm -r libGLESv2.so.old
	fi
	
	if dir libvulkan_intel.so.old; then 
	sudo rm -r libvulkan_intel.so.old
	fi
	
	if dir libvulkan_radeon.so.old; then
	sudo rm -r libvulkan_radeon.so.old
	fi
	
	if dir libxatracker.so.2.5.0.old; then
	sudo rm -r libxatracker.so.2.5.0.old
	fi
	
	if dir libxatracker.so.2.old; then 
	sudo rm -r libxatracker.so.2.old
	fi
	
	if dir libxatracker.so.old; then
	sudo rm -r libxatracker.so.old
	fi
	
	if dir libXvMCnouveau.so.old; then
	sudo rm -r libXvMCnouveau.so.old
	fi
	
	if dir libXvMCr600.so.old; then 
	sudo rm -r libXvMCr600.so.old
	fi
}

