# Maintainer: Noppakorn Jiravaranun <noppakorn at noppakorn dot com>
# Contributor: INhBQfUQO2eFzulN <281587887a at protonmail dot ch>
_pkgname=oscar
pkgname=$_pkgname-bin
pkgver=1.5.1
pkgrel=1
pkgdesc="Open Source CPAP Analysis Reporter"
arch=(x86_64)
url="https://www.sleepfiles.com/OSCAR/"
license=('GPL')
conflicts=("oscar-git")
provides=("$_pkgname")
depends=("qt5-serialport")
source=("https://www.apneaboard.com/OSCAR/${_pkgname}_$pkgver-Debian12_amd64.deb")
sha256sums=("491e95972cc44f65fc5a638f8ff2747f60ff3bb72316d9797da7b13071a1bd8a")

package() {
	echo $srcdir
	tar -xf data.tar.gz -C $pkgdir
}
