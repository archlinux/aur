# Contributor: Bernardo Barros <<bbarros at xsounds dot org>>
# Contributor: Thomas Weißschuh <thomas_weissschuh || lavabit || com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=lilypond-devel-docs
pkgver=2.19.84
pkgrel=1
pkgdesc="Offline documentation for lilypond"
arch=('any')
url="http://lilypond.org"
license=('GPL')
options=('!strip')
source=("http://lilypond.org/downloads/binaries/documentation/lilypond-${pkgver}-1.documentation.tar.bz2")
sha256sums=('d6007a1d2e6d4e63ab0fd072e7126274323d18cdbc4e62057946b7903eb7913f')

package(){
  install -d "$pkgdir"/usr/share
  cp -R "$srcdir"/share/doc/ "$srcdir"/share/omf/ "$pkgdir"/usr/share/
}
