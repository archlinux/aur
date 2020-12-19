# Maintainer: Roman Vasilev <2rvasilev@live.ru>

pkgname=zoomdl
pkgver=2020.11.07
pkgrel=1
epoch=
pkgdesc="Download Zoom recorded meetings easily"
arch=('any')
url="https://github.com/Battleman/zoomdl"
license=('GPL')
groups=()
depends=('python')
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
source=("https://github.com/Battleman/zoomdl/releases/download/$pkgver/$pkgname")
noextract=()
md5sums=('6bdd65c18555d5db0e5aa60885b1ebd3')
validpgpkeys=()

package() {
    chmod +x $pkgname
    install -D $pkgname "$pkgdir/usr/bin/$pkgname"
}

