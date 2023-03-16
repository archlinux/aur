# Maintainer: Kimiblock <pn3535@icloud.com>
pkgname=kvlibadwaita
pkgver=r21.61f2e0b
pkgrel=1
epoch=
pkgdesc="Libadwaita style theme for Kvantum. Based on Colloid-kde."
arch=('any')
url="https://github.com/GabePoel/KvLibadwaita"
license=('GPL3')
groups=()
depends=('kvantum')
makedepends=()
checkdepends=()
optdepends=()
provides=(kvlibadwaita)
conflicts=()
replaces=()
install=
source=("git+https://github.com/GabePoel/KvLibadwaita")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
   cd KvLibadwaita
   printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}"/KvLibadwaita
    mkdir -p "${pkgdir}"/usr/share/Kvantum
    cp -r ./src/* "${pkgdir}"/usr/share/Kvantum
}
