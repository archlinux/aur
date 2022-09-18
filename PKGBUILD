# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Rishab Ramanathan <rrishab2001 at gmail dot tld>
pkgname=donut-ramanathan
pkgver=0.1
pkgrel=1
pkgdesc="Packaging the donut.c script"
arch=(x86_64)
url="https://github.com/wonder-coconut/donut.git"
license=('GPL')
depends=(glibc)
makedepends=(git make)
optdepends=()
provides=(donut)
source=("git+$url")
md5sums=(SKIP)

package() {
	cd donut
	make DESTDIR="$pkgdir/" install
}
