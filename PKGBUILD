# Maintainer: Hicham Harouiz <hicham.harouiz@gmail.com>
pkgname=st-hh
pkgver=0.8.5
pkgrel=1
pkgdesc="This is my build of st"
arch=(x86_64)
url="https://github.com/hharouiz/st-hh.git"
license=('MIT')
depends=(ttf-hack ttf-joypixels)
makedepends=(git)
optdepends=()
provides=(st)
conflicts=(st)
source=("git+$url")
md5sums=("SKIP")

package() {
	cd st-hh
	make DESTDIR="$pkgdir/" install
}
