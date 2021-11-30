# Contributor: Bernardo Barros <<bbarros at xsounds dot org>>
# Contributor: Thomas Weißschuh <thomas_weissschuh || lavabit || com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=lilypond-devel-docs
pkgver=2.23.5
pkgrel=1
pkgdesc="Offline documentation for the unstable version of lilypond"
arch=('any')
url="http://lilypond.org"
license=('GPL')
options=('!strip')
conflicts=('lilypond-docs')
provides=('lilypond-docs')
source=("http://lilypond.org/downloads/binaries/documentation/lilypond-${pkgver}-1.documentation.tar.bz2")
sha256sums=('e2b528b3ce70058b634fd76b097f975760c0ad86148d9ec63b66c73a941b0afd')

package(){
  install -d "$pkgdir"/usr
  cp -R "$srcdir"/share/ "$pkgdir"/usr/share/
}
