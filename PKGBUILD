# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>

pkgname=otf-vegur
pkgver=0.701
pkgrel=3
pkgdesc='Humanist sans-serif font used for the LibreOffice logo'
arch=('i686' 'x86_64')
license=('custom:CC0')
url='http://dotcolon.net/font/?id=vegur'
depends=('fontconfig' 'xorg-font-utils')
source=('http://dotcolon.net/DL/font/vegur.zip')
sha256sums=('cfb06f0860aae4a6ed0ffaba4ab749a7c09c7f482e68a284a6f832c8382669ed')

package() {
	install -d $pkgdir/usr/share/fonts/OTF/
	install -m644 *.otf $pkgdir/usr/share/fonts/OTF/
}
