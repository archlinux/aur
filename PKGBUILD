# Maintainer: Anaël Megna <anael.megna@gmail.com>
pkgname=menu-generator
pkgver=1.0
pkgrel=1
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
md5sums=('dfb4e71811591aca16a63241787a1418')
noextract=()
validpgpkeys=()

package() {
    cd "$pkgname"

    cp -r ./* "$pkgdir"

    cd ..
    rm -r "$pkgname"
}
