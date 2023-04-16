# Maintainer: INhBQfUQO2eFzulN <281587887a at protonmail dot ch>
_pkgname=oscar
pkgname=$_pkgname-bin
pkgver=1.4.0
pkgrel=1
pkgdesc="Open Source CPAP Analysis Reporter"
arch=(x86_64)
url="https://www.sleepfiles.com/OSCAR/"
license=('GPL')
conflicts=("oscar-git")
provides=("$_pkgname")
source=("https://www.apneaboard.com/OSCAR/${_pkgname}_$pkgver-Debian11_amd64.deb")
sha256sums=("cbb1549d89ae8b8d6b3293ff7f9cf0220370c02b061986e15cf0c0c2bc93f6f6")

package() {
	echo $srcdir
	tar -xf data.tar.gz -C $pkgdir
}
