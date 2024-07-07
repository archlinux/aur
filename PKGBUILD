# Maintainer: Noppakorn Jiravaranun <noppakorn at noppakorn dot com>
# Contributor: INhBQfUQO2eFzulN <281587887a at protonmail dot ch>
_pkgname=oscar
pkgname=$_pkgname-bin
pkgver=1.5.3
pkgrel=1
pkgdesc="Open Source CPAP Analysis Reporter"
arch=(x86_64)
url="https://www.sleepfiles.com/OSCAR/"
license=('GPL')
conflicts=("oscar-git")
provides=("$_pkgname")
depends=("qt5-serialport")
source=("https://www.apneaboard.com/OSCAR/${pkgver}/${_pkgname}_${pkgver}-Debian12_amd64.deb")
sha256sums=("f798c6a97ef37764ba5041ff80a1643ae5282cf9708dd26a91944569e9ce6cc4")

package() {
	echo $srcdir
	tar -xf data.tar.gz -C $pkgdir
}
