# Maintainer: Andrea Agosti <cifvts at gmail dot com>

pkgname=ttf-inconsolata-g
pkgver=20090213
pkgrel=3
pkgdesc="Monospace font for pretty code listings and for the terminal modified by Leonardo Maffi (http://www.fantascienza.net/leonardo/)"
url="http://levien.com/type/myfonts/inconsolata.html"
license=('unknown')
depends=('fontconfig' 'xorg-font-utils')
source=('http://www.fantascienza.net/leonardo/ar/inconsolatag/inconsolata-g_font.zip')
install=ttf-inconsolata-g.install
arch=('any')
md5sums=('c36e53cb9022f8096fb78a0aae00cbb0')
         
package() {
    install -Dm644 $srcdir/Inconsolata-g.otf $pkgdir/usr/share/fonts/TTF/ttf-inconsolata-g.otf
}
