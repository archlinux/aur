# Maintainer: Your Name <youremail@example.com>
pkgname=zen-browser-url-to-desktop
pkgver=0.1.0
author=eon-ic
pkgrel=1
pkgdesc="将浏览器 URL 转换为桌面应用的工具"
arch=('any')
url="https://github.com/$author/$pkgname"
license=('MIT')
depends=("zen-browser")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")

package() {
    cd "$srcdir/"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
