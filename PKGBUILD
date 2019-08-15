# Maintainer: Nathan Monfils (nathan.monfils@hotmail.fr)

pkgname=ttf-haeck
pkgver=0.1
pkgrel=2
pkgdesc="Hæck is the Hack fork with programming ligatures."
url="https://github.com/ignatov/haack"
license=('unknown')
depends=('fontconfig' 'xorg-font-utils')
source=('https://github.com/ignatov/Haack/releases/download/0.1/Haeck-Regular.ttf')
install=ttf-haeck.install
arch=('any')
md5sums=('248aaf093d99ffa5cbb933f68e7e986a')
         
package() {
    install -Dm644 $srcdir/Haeck-Regular.ttf $pkgdir/usr/share/fonts/TTF/ttf-haeck-regular.ttf
}
