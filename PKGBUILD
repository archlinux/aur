# Maintainer: Noppakorn Jiravaranun <noppakorn at noppakorn dot com>
# Contributor: INhBQfUQO2eFzulN <281587887a at protonmail dot ch>
_pkgname=oscar
pkgname=$_pkgname-bin
pkgver=1.7.2
pkgrel=1
pkgdesc="Open Source CPAP Analysis Reporter"
arch=(x86_64)
url="https://www.sleepfiles.com/OSCAR/"
license=('GPL')
conflicts=("oscar-git")
provides=("$_pkgname")
depends=("qt5-serialport")
source=("https://www.sleepfiles.com/OSCAR/${pkgver}/${_pkgname}_${pkgver}-Debian13_amd64-Qt5.deb")
sha256sums=("6eacb91b21ece3978b7e95839eb4ce17fb916c7232cb19e7e112f751961edece")

package() {
	echo $srcdir
	tar -xf data.tar.gz -C $pkgdir
}

