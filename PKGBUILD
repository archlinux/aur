# Maintainer: Brian Alberg <brian at alberg dot org>
# Contributor: Brian Alberg <brian at alberg dot org>
pkgname=ttf-quicksand
pkgver=20191023
_hgver=3f5f3dc20e70
pkgrel=1
pkgdesc="Google Fonts Quicksand font by Andrew Paglinawan"
arch=('any')
license=('Open Font License')
url="http://www.google.com/fonts/specimen/Quicksand"
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=$pkgname.install
source=(https://github.com/google/fonts/raw/master/ofl/quicksand/statics/Quicksand-{Bold,Light,Medium,Regular}.ttf)
md5sums=('abae4f617e3ba9b9ad15e497a20c2d2b'
         '064bd27b159328acde9d8980e5625bc6'
         '4583607a62d10a20a5fb53c2ea28188a'
         '5a8d69b790df6a52545bdce17643fb39')

package() {
  cd $srcdir

  install -d $pkgdir/usr/share/fonts/TTF
  install -m644 $srcdir/Quicksand*.ttf $pkgdir/usr/share/fonts/TTF
}
