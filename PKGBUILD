# Maintainer: Moritz Schönherr <moritz.schoenherr@gmail.com>
pkgname=ttf-sparks-scrapbook
pkgver=1
pkgrel=2
pkgdesc="Free sparks scrapbook miniatures" 
arch=('any')
license=('custom')
url="http://www222.pair.com/sjohn/sparks.htm"
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=ttf.install
source=("http://www222.pair.com/sjohn/free/scrapbook.zip")

md5sums=('a8f0e71aba97829b857b42167020fd0b')

package() {
  cd $srcdir
  mv 'SPARKS Scrapbook.TTF' sparks-scrapbook.ttf
  install -d $pkgdir/usr/share/fonts/TTF/
  install -m644 *.ttf $pkgdir/usr/share/fonts/TTF/ || return 1
  install -Dm644 *.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
