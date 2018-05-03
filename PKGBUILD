# Maintainer: mistiru (Anaël Megna) <anael.megna@gmail.com>
pkgname=menu-generator
pkgver=1.0
pkgrel=2
pkgdesc="Dirty script that generates super cool bash menu"
arch=('any')
url=
license=('GPL3')
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
install=
changelog=
source=("$pkgname-$pkgver.tar.gz")
md5sums=('0958aa3353643b9775d9b034f8c8dd51')
noextract=()
validpgpkeys=()

package() {
    cd "$pkgname"

    cp -r ./* "$pkgdir"

    cd ..
    rm -r "$pkgname"
}
