# Maintainer: Jolly Roberts jolly.development@gmail.com
pkgname=icon-explorer
pkgver=v1.1
pkgrel=1
pkgdesc="A small utility to examine app icons for installed icon themes."
arch=('x86_64')
url="https://gitlab.com/JollyDevelopment/icon-explorer"
license=('GPL')
depends=('python>=3.0' 'gtk3')
replaces=('icon-explorer=1.0-2')
source=("https://gitlab.com/JollyDevelopment/icon-explorer/-/archive/v1.1/icon-explorer-v1.1.tar.gz")
md5sums=('a33b9fa2ddcbf8834310e1b15843c0ac')
package() {
        cd "$pkgname-$pkgver"/app
        install -Dm755 "$pkgname" -t "$pkgdir/opt/$pkgname"
        cp -r helpers ui "$pkgdir/opt/$pkgname"
        install -Dm 644 Icon-Explorer.desktop  "$pkgdir/usr/share/applications/$pkgname.desktop"
}
