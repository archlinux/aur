# Maintainer: Moritz Schönherr <moritz.schoenherr@gmail.com>
pkgname=ttf-sparks-scrapbook
_realname=Amerika
pkgver=1
pkgrel=3
pkgdesc="Free sparks scrapbook miniatures" 
arch=('any')
license=('custom')
url="http://www222.pair.com/sjohn/sparks.htm"
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=ttf.install
source=("http://www222.pair.com/sjohn/free/scrapbook.zip")

md5sums=('2ade7bd63b79739ef51862c2824b2062')

package() {
  cd $srcdir
  mv 'SPARKS Scrapbook.TTF' sparks-scrapbook.ttf
  install -d $pkgdir/usr/share/fonts/TTF/
  install -m644 *.ttf $pkgdir/usr/share/fonts/TTF/ || return 1
  install -Dm644 *.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
