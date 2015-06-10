# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>

pkgname=otf-vegur
pkgver=0.701
pkgrel=1
pkgdesc='Humanist sans-serif font used for the LibreOffice logo'
arch=('i686' 'x86_64')
license=('custom:CC0')
url='http://www.dotcolon.net/font/?id=vegur'
depends=('fontconfig' 'xorg-font-utils')
source=('http://www.dotcolon.net/DL/font/vegur.zip')
md5sums=('230bd8b9e28aeadb1113cdd508b69c2b')
install=$pkgname.install

package() {
	install -d $pkgdir/usr/share/fonts/OTF/
	install -m644 *.otf $pkgdir/usr/share/fonts/OTF/
}
