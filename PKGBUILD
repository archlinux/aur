# Maintainer: Jolly Roberts jolly.development@gmail.com
pkgname=icon-explorer
pkgver=v1.3
pkgrel=1
pkgdesc="A small utility to examine app icons for installed icon themes."
arch=('x86_64')
url="https://gitlab.com/JollyDevelopment/icon-explorer"
license=('GPL')
depends=('python>=3.0' 'python-natsort' 'gtk3')
replaces=('icon-explorer=1.0-2')
source=("https://gitlab.com/JollyDevelopment/icon-explorer/-/archive/v1.3/icon-explorer-v1.3.tar.gz")
md5sums=('bd0b4b7767200a9832c3cb458c7f30a9')
package() {
        cd "$pkgname-$pkgver"/app
        install -Dm755 "$pkgname" -t "$pkgdir/opt/$pkgname"
        cp -r helpers ui "$pkgdir/opt/$pkgname"
        install -Dm 644 Icon-Explorer.desktop  "$pkgdir/usr/share/applications/$pkgname.desktop"
}
