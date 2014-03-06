# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=lilypond-docs
pkgver=2.18.0
pkgrel=1
pkgdesc="Offline documentation for lilypond"
arch=(any)
url="http://lilypond.org"
depends=("lilypond=${pkgver}")
license=("GPL")
options=("!strip")
source=("http://lilypond.org/download/binaries/documentation/lilypond-${pkgver}-1.documentation.tar.bz2")

package(){
  mkdir -p "${pkgdir}/usr/share"
  cp -R "${srcdir}/share/"{doc,omf} "${pkgdir}/usr/share/"
}

sha256sums=('ade8bd8e34670070df2c2388a83d64a65204b5bd22919851ff6fa99910f785b3')
