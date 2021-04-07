# Maintainer: Jolly Roberts jolly.development@gmail.com
pkgname=icon-explorer
pkgver=1.0
pkgrel=2
pkgdesc="A small utility to examine app icons for installed icon themes."
arch=('x86_64')
url="https://gitlab.com/JollyDevelopment/icon-explorer"
license=('GPL')
depends=('python>=3.0' 'gtk3')
source=("https://gitlab.com/JollyDevelopment/icon-explorer/-/archive/1.0/icon-explorer-1.0.tar.gz")
md5sums=('b8235b121664d97587ab820a76f8a28c')
package() {
        cd "$pkgname-$pkgver"/app
        install -Dm755 "$pkgname" -t "$pkgdir/opt/$pkgname"
        cp -r helpers ui "$pkgdir/opt/$pkgname"
        install -Dm 644 Icon-Explorer.desktop  "$pkgdir/usr/share/applications/$pkgname.desktop"
}
