# Maintainer: bery aquaberryog@gmail.com
pkgname=pytimer
pkgver=1
pkgrel=1
epoch=
pkgdesc="Simple CLI timer app written in python"
arch=('any')
url="https://github.com/AndrejPatak/Pytimer"
license=('GPL-3.0-or-later')
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
install="$pkgname.install"
changelog=
source=("$pkgname-$pkgver.tar.gz::https://github.com/AndrejPatak/Pytimer/tree/main/archive/$pkgver.tar.gz"
        "pytimer-bin")


noextract=()
sha256sums=('c897e5e53a50e377a21153da8c8fb782369900f7364f61c1ce2ce4507add1579'
            '82dc7bd9692a1f8b6eda9271717e67238d71e7b28d37d0066217ec779882afcf')
validpgpkeys=()

post_install() {
	sh "$pkgname.install"
}
