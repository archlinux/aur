# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=lilypond-docs
pkgver=2.22.1
pkgrel=1
pkgdesc="Offline documentation for lilypond"
arch=(any)
url="http://lilypond.org"
depends=()
license=("GPL")
options=("!strip")
source=("https://lilypond.org/downloads/binaries/documentation/lilypond-${pkgver}-1.documentation.tar.bz2")


package(){
  mkdir -p "${pkgdir}/usr/share"
  cp -R "${srcdir}/share/doc" "${pkgdir}/usr/share/"
}

sha256sums=('ba619cda0ea1ac29f25d7e110c8f42f87adbf8207a7446829c90f8b7dee8d3ec')
