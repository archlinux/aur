# Contributor: Bernardo Barros <<bbarros at xsounds dot org>>
# Contributor: Thomas Weißschuh <thomas_weissschuh || lavabit || com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=lilypond-devel-docs
pkgver=2.21.6
pkgrel=1
pkgdesc="Offline documentation for the unstable version of lilypond"
arch=('any')
url="http://lilypond.org"
license=('GPL')
options=('!strip')
conflicts=('lilypond-docs')
provides=('lilypond-docs')
source=("http://lilypond.org/downloads/binaries/documentation/lilypond-${pkgver}-1.documentation.tar.bz2")
sha256sums=('d4afbfe4a363a94a09612dece2e1428f56b18c313c213534ec38eaa914e4d97e')

package(){
  install -d "$pkgdir"/usr
  cp -R "$srcdir"/share/ "$pkgdir"/usr/share/
}
