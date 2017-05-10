# Maintainer: kertase <kertase at gmail dot com>

pkgname=ttf-unifont-csur
pkgver=9.0.06
pkgrel=1
pkgdesc="TrueType part of the GNU Unifont containing Michael Everson's ConScript Unicode Registry (CSUR) Private Use Area (PUA) glyphs"
url="http://unifoundry.com/unifont.html"
arch=('any')
license=('GPL')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils' 'ttf-unifont')
install=ttf.install
source=( http://unifoundry.com/pub/unifont-$pkgver/font-builds/unifont_csur-$pkgver.ttf
)
sha512sums=('aec803cb9ebf63b36e2c19c50460c4ba62bd720d18a87e1696e4f3a97b62f28c21c14c6262c5c8b9389804eef8b1d95f7fe57480fea63fc6cefeec1af3737b73')

package() {
  cd $srcdir
  install -d $pkgdir/usr/share/fonts/TTF/
  install -m644 unifont_csur-$pkgver.ttf $pkgdir/usr/share/fonts/TTF/Unifont_CSUR.ttf
}
