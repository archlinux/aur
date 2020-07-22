 #Maintainer: dongliming <idongliming@qq.com>
pkgname=syschk
pkgver=1.0
pkgrel=1
epoch=
pkgdesc="myself system check"
arch=("x86_64")
url="https://github.com/idongliming"
license=('GPL')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=${pkgname}.install
changelog=
source=("syschk")
noextract=()
md5sums=('28beb6a8450843f31a77d0f174250e82')
validpgpkeys=()

package() {
	install -dm755  "${pkgdir}/usr/bin"
	cp syschk "${pkgdir}/usr/bin/syschk"
}
