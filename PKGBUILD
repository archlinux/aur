# Maintainer: Moritz Schönherr <moritz.schoenherr@gmail.com>
pkgname=ttf-sparks-ffa
pkgver=1
pkgrel=2
pkgdesc="Free sparks miniature font by J. Ross"
arch=('any')
license=('custom')
url="http://www222.pair.com/sjohn/sparks.htm"
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=ttf.install
source=("http://www222.pair.com/sjohn/free/sprkffa.zip")

md5sums=('3682a4dab12861218fbdce29cc16173f')

package() {
  cd $srcdir
  mv 'SPARKS Free-for-All.TTF' sparks-ffa.ttf
  install -d $pkgdir/usr/share/fonts/TTF/
  install -m644 *.ttf $pkgdir/usr/share/fonts/TTF/ || return 1
  install -Dm644 *.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
