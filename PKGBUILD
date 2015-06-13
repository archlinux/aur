# Maintainer: Denis Kasak <dkasak|AT|termina.org.uk>

pkgname=ttf-inconsolata-dz
pkgver=20091202
pkgrel=3
pkgdesc="Monospace font for pretty code listings and for the terminal (modified to have straight single and double quotes)"
arch=('any')
url="http://nodnod.net/2009/feb/12/adding-straight-single-and-double-quotes-inconsola/"
license=('custom:OFL')
depends=('fontconfig' 'xorg-font-utils')
provides=('ttf-font')
source=('http://media.nodnod.net/Inconsolata-dz.otf.zip'
	'OFL.txt')
install=${pkgname}.install
md5sums=('8510443343f43382566511e73abc06f8'
         '6ed93967ff0dc6dd9c8d31c17f817a06')
         
package() {
    install -Dm644 $srcdir/Inconsolata-dz.otf $pkgdir/usr/share/fonts/TTF/ttf-inconsolata-dz.otf
    install -Dm644 $srcdir/OFL.txt $pkgdir/usr/share/licenses/ttf-inconsolata-dz/OFL.txt
}
