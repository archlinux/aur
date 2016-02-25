# Maintainer: Fabien Devaux <fdev31@gmail.com>
pkgname=plosetup
pkgver=1.1.2
pkgrel=1
epoch=
pkgdesc="helper to set up loop devices for partitions in a disk image"
arch=("any")
url="https://github.com/fdev31/arch-plosetup/"
license=('Artistic2.0')
groups=()
depends=()
makedepends=('curl')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/fdev31/arch-plosetup/raw/$pkgver/$pkgname")
noextract=("https://github.com/fdev31/arch-plosetup/raw/$pkgver/$pkgname")
md5sums=('152e43dd9159597a63e2016fe428cb7a')
validpgpkeys=()

prepare() {
    chmod +x plosetup
}

build() {
    return 0
}

check() {
    return 0
}

package() {
    install -D -o root -g root -m 755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
