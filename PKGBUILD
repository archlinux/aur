# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=lilypond-docs
pkgver=2.16.2
pkgrel=1
pkgdesc="Offline documentation for lilypond"
arch=(any)
url="http://lilypond.org"
depends=("lilypond=${pkgver}")
license=("GPL")
options=("!strip")
source=("http://lilypond.org/download/binaries/documentation/lilypond-${pkgver}-1.documentation.tar.bz2")
sha256sums=('d84bb0a88472eb414d5948268782503f0fb59be8ba1d03b2d045332041057d84')

package(){
  mkdir -p "${pkgdir}/usr/share"
  cp -R "${srcdir}/share/"{doc,omf} "${pkgdir}/usr/share/"
}

# vim: sw=2:ts=2 et:
