# Contributor: Bernardo Barros <<bbarros at xsounds dot org>>
# Contributor: Thomas Weißschuh <thomas_weissschuh || lavabit || com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=lilypond-devel-docs
pkgver=2.19.83
pkgrel=1
pkgdesc="Offline documentation for lilypond"
arch=('any')
url="http://lilypond.org"
license=('GPL')
options=('!strip')
source=("http://lilypond.org/downloads/binaries/documentation/lilypond-${pkgver}-1.documentation.tar.bz2")
sha256sums=('5ca48118b552b5ebf64dcc49d846d6cc23df6292bdea06216a0df1d083e2fc90')

package(){
  install -d "$pkgdir"/usr/share
  cp -R "$srcdir"/share/doc/ "$srcdir"/share/omf/ "$pkgdir"/usr/share/
}
