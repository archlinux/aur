# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

#Maintainer:  sparzz
pkgname=mesa-radv-drivers-git
packager=sparzz
pkgver=1
pkgrel=1
epoch=
pkgdesc="mesa-radv-drivers-git"
arch=(x86_64)
url="https://github.com/sparzz/mesa.git"
license=('GPL')
groups=()
depends=("llvm")
depends=("meson")
makedepends=()
checkdepends=()
optdepends=()
provides=(mesa-radv-drivers)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/sparzz/mesa.git")
noextract=()
md5sums=("SKIP")
validpgpkeys=()

prepare() {
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
	git clone https://github.com/sparzz/mesa.git
	cd mesa
	mkdir build
	sudo meson build/
}



package() {
	sudo DESTDIR="$pkgdir" ninja $NINJAFLAGS -C mesa/build/ install 
	
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

