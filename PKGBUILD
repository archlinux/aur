# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: Maximilian Stein <theoddbird@posteo.org>
# Contributor: Vasily Ryabov
# Contributor: Sebastien Duthil <duthils@free.fr>
# Contributor: Daniele Paolella
# Contributor: twa022 <twa022 at gmail dot com>

pkgname=firefox-firetray
pkgver=0.5.6.1
pkgrel=1
pkgdesc="System tray extension for Firefox"
arch=('any')
url="http://addons.mozilla.org/firefox/addon/firetray"
license=('GPL3')
depends=('firefox')
source=("${pkgname}-${pkgver}.xpi::https://addons.cdn.mozilla.net/user-media/addons/4868/firetray-0.5.6-sm+tb+fx-linux.xpi")
sha256sums=('132da3dfbcea943117d63b983095fb9145f74a08d0e5654b20b2a09df9868a0f')
package() {
    mkdir -p "$pkgdir/usr/lib/firefox/browser/extensions/{9533f794-00b4-4354-aa15-c2bbda6989f8}"
    cp -a $(find $srcdir -mindepth 1 -maxdepth 1 ! -name *.xpi) \
             "$pkgdir/usr/lib/firefox/browser/extensions/{9533f794-00b4-4354-aa15-c2bbda6989f8}"
}
