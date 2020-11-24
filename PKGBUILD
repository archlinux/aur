# Maintainer: Rômulo Cenci <romcenci@gmail.com>
pkgname=dynsim
pkgver=1.0.0
pkgrel=1
pkgdesc="A tool to assist in the visualization of simulations and dynamics of physical systems, in 1 and 2 dimensions."
arch=("i686" "x86_64") 
url="https://github.com/romcenci/DynamicSimulator"
license=('BSD-3')
groups=()
depends=('glfw-x11'
	 'glibc'
	 'fftw')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://github.com/romcenci/DynamicSimulator/releases/download/v$pkgver/v$pkgver.tar.xz)
noextract=()
md5sums=('c5c27ba457bc9b3198ab7ae9e6ae10c1')

build() {
  make
}

package() {
  mkdir -p ${pkgdir}/usr/share/man/man1/
  make DESTDIR="$pkgdir" install
}
