# Maintainer: Thomas Weißschuh <thomas_weissschuh || lavabit || com>

pkgname=lilypond-docs
pkgver=2.14.2
pkgrel=1
pkgdesc="Offline documentation for lilypond"
arch=(any)
url="http://lilypond.org"
depends=("lilypond=${pkgver}")
license=("GPL")
options=("!strip")
source=("http://lilypond.org/download/binaries/documentation/lilypond-${pkgver}-1.documentation.tar.bz2")
sha1sums=('da2e66a604c06ff55e66e11ec8812c2c32b4cf6f')

package(){
  mkdir -p ${pkgdir}/usr/share
  cp -R ${srcdir}/share/doc/ ${srcdir}/share/omf/ ${pkgdir}/usr/share/
}
# vim: sw=2:ts=2 et:
