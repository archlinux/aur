# Maintainer: kertase <kertase at gmail dot com>

pkgname=ttf-unifont-csur
pkgver=9.0.02
pkgrel=1
pkgdesc="TrueType version of the GNU Unifont with Michael Everson's ConScript Unicode Registry (CSUR) Private Use Area (PUA) glyphs"
url="http://unifoundry.com/unifont.html"
arch=('any')
license=('GPL')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils' 'ttf-unifont')
install=ttf.install
source=( http://unifoundry.com/pub/unifont-$pkgver/font-builds/unifont_csur-$pkgver.ttf
)
md5sums=('8c11bbe5ecbc72cc9368e44ecf6b7f77')

package() {
  cd $srcdir
  install -d $pkgdir/usr/share/fonts/TTF/
  install -m644 unifont_csur-$pkgver.ttf $pkgdir/usr/share/fonts/TTF/Unifont_CSUR.ttf
}
