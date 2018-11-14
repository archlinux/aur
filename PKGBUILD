 # Maintainer: Daniel Peukert <dan.peukert@gmail.com>
pkgname='railway-sans-font'
pkgver='20170421'
pkgrel='1'
pkgdesc="An open source version of Edward Johnston's Timeless Typeface for London Underground of 1916"
arch=('any')
url='https://fontlibrary.org/en/font/railway-sans'
license=('OFL:SIL Open Font License http://opensource.org/licenses/OFL-1.1')
depends=('fontconfig' 'xorg-font-utils')
source=('https://fontlibrary.org/assets/downloads/railway-sans/9f707f44ac7fca4fb8371e69b19df471/railway-sans.zip')
md5sums=('9f707f44ac7fca4fb8371e69b19df471')

package() {
	install -dm755 $pkgdir/usr/share/fonts/{O,T}TF
	install -m644 ${srcdir}/OTF/*.otf ${pkgdir}/usr/share/fonts/OTF/
	install -m644 ${srcdir}/TTF/*.ttf ${pkgdir}/usr/share/fonts/TTF/
}
