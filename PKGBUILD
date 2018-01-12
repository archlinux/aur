# Maintainer: Brian Alberg <brian at alberg dot org>
# Contributor: Brian Alberg <brian at alberg dot org>
pkgname=ttf-quicksand
pkgver=20180111
_hgver=3f5f3dc20e70
pkgrel=1
pkgdesc="Google Fonts Quicksand font by Andrew Paglinawan"
arch=('any')
license=('Open Font License')
url="http://www.google.com/fonts/specimen/Quicksand"
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=$pkgname.install
source=(https://github.com/google/fonts/raw/master/ofl/quicksand/Quicksand-{Bold,Light,Medium,Regular}.ttf)
md5sums=('0c04462696ac0fd3e85e75415b483fdb'
         'c5f954788f341b22e1974433bb972ac1'
         '0c64233241ead44bffbec54eb9d1d164'
         'f87b9b4f34bdbf75b5c0cf3a5a137508')

package() {
  cd $srcdir

  install -d $pkgdir/usr/share/fonts/TTF
  install -m644 $srcdir/Quicksand*.ttf $pkgdir/usr/share/fonts/TTF
}
