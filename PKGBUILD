# Contributor: Bernardo Barros <<bbarros at xsounds dot org>>
# Contributor: Thomas Weißschuh <thomas_weissschuh || lavabit || com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=lilypond-devel-docs
pkgver=2.21.82
pkgrel=1
pkgdesc="Offline documentation for the unstable version of lilypond"
arch=('any')
url="http://lilypond.org"
license=('GPL')
options=('!strip')
conflicts=('lilypond-docs')
provides=('lilypond-docs')
source=("http://lilypond.org/downloads/binaries/documentation/lilypond-${pkgver}-1.documentation.tar.bz2")
sha256sums=('f8cb74f452472b38fd1e67a09405efd0f52d38b3b85a62c5e998a698dd82c2b7')

package(){
  install -d "$pkgdir"/usr
  cp -R "$srcdir"/share/ "$pkgdir"/usr/share/
}
