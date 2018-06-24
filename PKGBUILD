# Contributor: Bernardo Barros <<bbarros at xsounds dot org>>
# Contributor: Thomas Weißschuh <thomas_weissschuh || lavabit || com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=lilypond-devel-docs
pkgver=2.19.82
pkgrel=1
pkgdesc="Offline documentation for lilypond"
arch=('any')
url="http://lilypond.org"
license=('GPL')
options=('!strip')
source=("http://lilypond.org/downloads/binaries/documentation/lilypond-${pkgver}-1.documentation.tar.bz2")
sha256sums=('b95539396580882e498661cfd150cd4a46f4efbc54ec1e170a8fdb57d31dc1ed')

package(){
  install -d "$pkgdir"/usr/share
  cp -R "$srcdir"/share/doc/ "$srcdir}"/share/omf/ "$pkgdir"/usr/share/
}
