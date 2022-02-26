# Maintainer: INhBQfUQO2eFzulN <281587887a at protonmail dot ch>
_pkgname=oscar
pkgname=$_pkgname-bin
pkgver=1.3.1
pkgrel=1
pkgdesc="Open Source CPAP Analysis Reporter"
arch=(x86_64)
url="https://www.sleepfiles.com/OSCAR/"
license=('GPL')
conflicts=("oscar-git")
provides=("$_pkgname")
source=("https://www.apneaboard.com/OSCAR/${_pkgname}_$pkgver-Debian11_amd64.deb")
sha256sums=("59596c4beba2c4378217759ce68994d26a241eb50033f93e76bf75e369cfff5e")

package() {
	echo $srcdir
	tar -xf data.tar.gz -C $pkgdir
}
