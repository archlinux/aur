# Contributor: Bernardo Barros <<bbarros at xsounds dot org>>
# Contributor: Thomas Weißschuh <thomas_weissschuh || lavabit || com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=lilypond-devel-docs
pkgver=2.20.0
pkgrel=1
pkgdesc="Offline documentation for lilypond"
arch=('any')
url="http://lilypond.org"
license=('GPL')
options=('!strip')
source=("http://lilypond.org/downloads/binaries/documentation/lilypond-${pkgver}-1.documentation.tar.bz2")
sha256sums=('a70e28cd9238b5e0e2deebeca19706d65a3ec3b6b874b6b5f0e73b486962aceb')

package(){
  install -d "$pkgdir"/usr/share
  cp -R "$srcdir"/share/doc/ "$srcdir"/share/omf/ "$pkgdir"/usr/share/
}
