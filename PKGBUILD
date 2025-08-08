# Maintainer: Noppakorn Jiravaranun <noppakorn at noppakorn dot com>
# Contributor: INhBQfUQO2eFzulN <281587887a at protonmail dot ch>
_pkgname=oscar
pkgname=$_pkgname-bin
pkgver=1.6.1
pkgrel=1
pkgdesc="Open Source CPAP Analysis Reporter"
arch=(x86_64)
url="https://www.sleepfiles.com/OSCAR/"
license=('GPL')
conflicts=("oscar-git")
provides=("$_pkgname")
depends=("qt5-serialport")
source=("https://www.apneaboard.com/OSCAR/${pkgver}/${_pkgname}_${pkgver}-Debian12_amd64.deb")
sha256sums=("1fe27d3371cfab39de33891a50539cbe249ed1d0cafd16c47caefa212dc163f9")

package() {
	echo $srcdir
	tar -xf data.tar.gz -C $pkgdir
}
