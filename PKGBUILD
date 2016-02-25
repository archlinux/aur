# Maintainer: Fabien Devaux <fdev31@gmail.com>
pkgname=plosetup
pkgver=1.0
pkgrel=1
epoch=
pkgdesc="helper to set up loop devices for partitions in a disk image"
arch=("any")
url="http://zwizwa.be/darcs/pool/bin/plosetup"
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
source=("http://zwizwa.be/darcs/pool/bin/plosetup")
noextract=("http://zwizwa.be/darcs/pool/bin/plosetup")
md5sums=("2de1300fd8cfeab9ab2de105f5144bda")
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
