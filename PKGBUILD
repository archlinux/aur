# Maintainer: Moritz Schönherr <moritz.schoenherr@gmail.com>
pkgname=ttf-sparks-ffa
_realname=Amerika
pkgver=1
pkgrel=1
pkgdesc="Free sparks miniature font by J. Ross"
arch=('any')
license=('custom')
url="http://www222.pair.com/sjohn/sparks.htm"
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=ttf.install
source=("http://www222.pair.com/sjohn/free/sprkffa.zip")

md5sums=('4423fc211c636eadecbb3c4c0ef7f499')

package() {
  cd $srcdir
  mv 'SPARKS Free-for-All.TTF' sparks-ffa.ttf
  install -d $pkgdir/usr/share/fonts/TTF/
  install -m644 *.ttf $pkgdir/usr/share/fonts/TTF/ || return 1
  install -Dm644 *.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
