# Maintainer: Roman Vasilev <2rvasilev@live.ru>

pkgname=zoomdl
pkgver=2021.05.27
pkgrel=2
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
md5sums=('f7c3cc2e1b88640974b5f65eaa88d9ac')
validpgpkeys=()

package() {
    chmod +x $pkgname
    install -D $pkgname "$pkgdir/usr/bin/$pkgname"
}

