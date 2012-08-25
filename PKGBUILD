# Maintainer: Thomas Weißschuh <thomas_weissschuh || lavabit || com>

pkgname=lilypond-docs
pkgver=2.16.0
pkgrel=1
pkgdesc="Offline documentation for lilypond"
arch=(any)
url="http://lilypond.org"
depends=("lilypond=${pkgver}")
license=("GPL")
options=("!strip")
source=("http://lilypond.org/download/binaries/documentation/lilypond-${pkgver}-1.documentation.tar.bz2")
sha1sums=('5ca5877d46430d3e6c40a631de6e88c62af67953')

package(){
  mkdir -p "${pkgdir}/usr/share"
  cp -R "${srcdir}/share/"{doc,info,omf} "${pkgdir}/usr/share/"
}

# vim: sw=2:ts=2 et:
