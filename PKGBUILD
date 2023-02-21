# Maintainer: Tokuhiro Matsuno <tokuhirom@gmail.com>
pkgname=akaza-default-model
pkgver=v0.4.0
pkgrel=1
# epoch=
pkgdesc=""
arch=("any")
url="https://github.com/akaza-im/akaza-default-model/"
license=('MIT')
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
source=("https://github.com/akaza-im/akaza-default-model/releases/download/$pkgver/$pkgname.tar.gz")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

package() {
    cd "$pkgname"
    install -d -m 755 "$pkgdir/usr/share/akaza/model/default/"
    install -m 644 * "$pkgdir/usr/share/akaza/model/default/"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
