# Contributor: Bernardo Barros <<bbarros at xsounds dot org>>
# Contributor: Thomas Weißschuh <thomas_weissschuh || lavabit || com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=lilypond-devel-docs
pkgver=2.19.56
pkgrel=1
pkgdesc="Offline documentation for lilypond"
arch=('any')
url="http://lilypond.org"
license=('GPL')
options=('!strip')
source=("http://lilypond.org/downloads/binaries/documentation/lilypond-${pkgver}-1.documentation.tar.bz2")
sha256sums=('d09cc5deff94a0f02ce04c182dbe2d87107da502b5710f268c0f379f80f726e4')

package(){
  install -d ${pkgdir}/usr/share
  cp -R ${srcdir}/share/doc/ ${srcdir}/share/omf/ ${pkgdir}/usr/share/
}
