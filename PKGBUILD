# Maintainer: mistiru (Anaël Megna) <anael.megna@gmail.com>
pkgname=susu
pkgver=1.0
pkgrel=1
pkgdesc="Really really dirty bash script that works on .ass subtitles"
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
md5sums=('fe95776392cb67dadf40aea9fe9e67e9')
noextract=()
validpgpkeys=()

package() {
    cd "$pkgname"

    cp -r ./* "$pkgdir"

    cd ..
    rm -r "$pkgname"
}
