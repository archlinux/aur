# Maintainer: Jolly Roberts jolly.development@gmail.com
pkgname=icon-explorer
pkgver=1.0
pkgrel=1
pkgdesc="A small utility to examine app icons for installed icon themes."
arch=('x86_64')
url="https://gitlab.com/JollyDevelopment/icon-explorer"
license=('GPL')
depends=('python>=3.0' 'gtk3')
source=("https://gitlab.com/JollyDevelopment/icon-explorer/-/archive/1.0/icon-explorer-1.0.tar.gz")
md5sums=('b8235b121664d97587ab820a76f8a28c')
package() {
        cd "$pkgname-$pkgver"
        cd app/
        mkdir -p "$pkgdir/"opt/icon-explorer
        mkdir -p "$pkgdir/"usr/bin
        mkdir -p "$pkgdir/"usr/share/applications/
        mv helpers "$pkgdir/"/opt/icon-explorer/
        mv icon-explorer "$pkgdir/"/opt/icon-explorer/icon-explorer
        mv Icon-Explorer.desktop "$pkgdir/"/opt/icon-explorer/
        mv ui "$pkgdir/"/opt/icon-explorer/
        ln -s "$pkgdir/"opt/icon-explorer/icon-explorer "$pkgdir/"usr/bin/icon-explorer
        ln -s "$pkgdir/"opt/icon-explorer/Icon-Explorer.desktop "$pkgdir/"usr/share/applications/Icon-Explorer.desktop
}
