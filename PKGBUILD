# Maintainer: Thomas Weißschuh <thomas_weissschuh || lavabit || com>

pkgname=lilypond-docs
pkgver=2.16.1
pkgrel=2
pkgdesc="Offline documentation for lilypond"
arch=(any)
url="http://lilypond.org"
depends=("lilypond=${pkgver}")
license=("GPL")
options=("!strip")
source=("http://lilypond.org/download/binaries/documentation/lilypond-${pkgver}-1.documentation.tar.bz2")
sha256sums=('018c48fcb8f0dafb5ebc31698895e889b3a8924860775ef76fcab9e6bba0b66e')

package(){
  mkdir -p "${pkgdir}/usr/share"
  cp -R "${srcdir}/share/"{doc,omf} "${pkgdir}/usr/share/"
}

# vim: sw=2:ts=2 et:
