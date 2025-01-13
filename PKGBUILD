# Maintainer: Noppakorn Jiravaranun <noppakorn at noppakorn dot com>
# Contributor: INhBQfUQO2eFzulN <281587887a at protonmail dot ch>
_pkgname=oscar
pkgname=$_pkgname-bin
pkgver=1.6.0
pkgrel=1
pkgdesc="Open Source CPAP Analysis Reporter"
arch=(x86_64)
url="https://www.sleepfiles.com/OSCAR/"
license=('GPL')
conflicts=("oscar-git")
provides=("$_pkgname")
depends=("qt5-serialport")
source=("https://www.apneaboard.com/OSCAR/${pkgver}/${_pkgname}_${pkgver}-Debian12_amd64.deb")
sha256sums=("b2e08f67b6b4928459035debf8b4c9909cb07ae71b70b7d932ca5b910454c41b")

package() {
	echo $srcdir
	tar -xf data.tar.gz -C $pkgdir
}
