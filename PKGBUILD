# Maintainer: kertase <kertase at gmail dot com>

pkgname=ttf-unifont-csur
pkgver=8.0.01
pkgrel=1
pkgdesc="TrueType version of the GNU Unifont with Michael Everson's ConScript Unicode Registry (CSUR) Private Use Area (PUA) glyphs"
url="http://unifoundry.com/unifont.html"
arch=('any')
license=('GPL')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=ttf.install
source=( http://unifoundry.com/pub/unifont-$pkgver/font-builds/unifont_csur-$pkgver.ttf
http://unifoundry.com/pub/unifont-$pkgver/font-builds/unifont_upper_csur-$pkgver.ttf )
md5sums=('c3a37a2a66f77f9c3c2c556056e123d2'
'8c9a0f32d4cfdb944a8bba6744e2648e')

package() {
  cd $srcdir
  install -d $pkgdir/usr/share/fonts/TTF/
  install -m644 unifont_csur-$pkgver.ttf $pkgdir/usr/share/fonts/TTF/Unifont_CSUR.ttf
  install -m644 unifont_upper_csur-$pkgver.ttf $pkgdir/usr/share/fonts/TTF/Unifont_upper_CSUR.ttf
}
