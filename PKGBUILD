# Maintainer: MrZ_26 <1046101471 at qq dot com>
pkgname=luatos-api
pkgver=0.1.0
pkgrel=1
pkgdesc="Lua type definitions for LuatOS embedded development, providing LuaLS auto-completion"
arch=('any')
url="https://github.com/26F-Studio/LuatOS_api"
license=('MIT')
depends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/26F-Studio/LuatOS_api/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -dm755 "$pkgdir/usr/share/$pkgname"
    cp -r peripheral system util extend "$pkgdir/usr/share/$pkgname/"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
