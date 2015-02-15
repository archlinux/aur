# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=lilypond-docs
pkgver=2.18.2
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

sha256sums=('e3d7474200448c9677925ccf4f90982ca87e8f789e143afdc6bf397f0e368b99')
