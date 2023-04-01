# Maintainer: Roman Vasilev <2rvasilev@live.ru>

pkgname=zoomdl
pkgver=2021.12.13c
pkgrel=1
epoch=
pkgdesc="[Deprecated 28.03.2023]Download Zoom recorded meetings easily"
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
source=("$pkgname-$pkgver::$url/releases/download/v$pkgver/$pkgname")
noextract=()
md5sums=('4b794f792077cb8e4387e33936c49307')
validpgpkeys=()

package() {
    chmod +x "$pkgname-$pkgver"
    install -D "$pkgname-$pkgver" "$pkgdir/usr/bin/$pkgname"
}

