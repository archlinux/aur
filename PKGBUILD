# Maintainer: Jolly Roberts jolly.development@gmail.com
pkgname=icon-explorer
pkgver=0.2
pkgrel=1
pkgdesc="A small utility to examine app icons for installed icon themes."
arch=('x86_64')
url="https://gitlab.com/JollyDevelopment/icon-explorer"
license=('GPL')
depends=('python>=3.0' 'gtk3')
source=("https://gitlab.com/JollyDevelopment/icon-explorer/-/archive/0.2/icon-explorer-0.2.tar.gz")
md5sums=('27810d5e0e169545dece399ef5d01931')
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
