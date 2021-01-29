# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=lilypond-docs
pkgver=2.22.0
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

sha256sums=('2698a407424e29abf834d12376fb33aa1bfa2afa8b7f3537120b0817b982bd8f')
