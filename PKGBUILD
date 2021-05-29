# Maintainer: Jolly Roberts jolly.development@gmail.com
pkgname=icon-explorer
pkgver=v1.2
pkgrel=1
pkgdesc="A small utility to examine app icons for installed icon themes."
arch=('x86_64')
url="https://gitlab.com/JollyDevelopment/icon-explorer"
license=('GPL')
depends=('python>=3.0' 'python-natsort' 'gtk3')
replaces=('icon-explorer=1.0-2')
source=("https://gitlab.com/JollyDevelopment/icon-explorer/-/archive/v1.2/icon-explorer-v1.2.tar.gz")
md5sums=('e4777497c3e7d3c45bdcdd41d67040d3')
package() {
        cd "$pkgname-$pkgver"/app
        install -Dm755 "$pkgname" -t "$pkgdir/opt/$pkgname"
        cp -r helpers ui "$pkgdir/opt/$pkgname"
        install -Dm 644 Icon-Explorer.desktop  "$pkgdir/usr/share/applications/$pkgname.desktop"
}
