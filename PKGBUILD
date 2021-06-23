# Maintainer: Roman Vasilev <2rvasilev@live.ru>

pkgname=zoomdl
pkgver=2021.06.21
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
source=("$url/releases/download/$pkgver/$pkgname")
noextract=()
md5sums=('6bc182963d5740fea1d49a0d9ed5cbe0')
validpgpkeys=()

package() {
    chmod +x $pkgname
    install -D $pkgname "$pkgdir/usr/bin/$pkgname"
}

