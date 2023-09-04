# Maintainer: Noppakorn Jiravaranun <noppakorn at noppakorn dot com>
# Contributor: INhBQfUQO2eFzulN <281587887a at protonmail dot ch>
_pkgname=oscar
pkgname=$_pkgname-bin
pkgver=1.5.0
pkgrel=1
pkgdesc="Open Source CPAP Analysis Reporter"
arch=(x86_64)
url="https://www.sleepfiles.com/OSCAR/"
license=('GPL')
conflicts=("oscar-git")
provides=("$_pkgname")
depends=("qt5-serialport")
source=("https://www.apneaboard.com/OSCAR/${_pkgname}_$pkgver-Debian12_amd64.deb")
sha256sums=("857cc395d789b4edc581902c74edc296813852f5fe08533061d52d3c9e2ab9e6")

package() {
	echo $srcdir
	tar -xf data.tar.gz -C $pkgdir
}
