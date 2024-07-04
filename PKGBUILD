# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=lilypond-docs
pkgver=2.24.3
pkgrel=1
pkgdesc="Offline documentation for lilypond"
arch=(any)
url="http://lilypond.org"
depends=()
license=("GPL")
options=("!strip")
source=("https://gitlab.com/lilypond/lilypond/-/releases/v${pkgver}/downloads/lilypond-${pkgver}-documentation.tar.xz")


package(){
  mkdir -p "${pkgdir}/usr/share"
  cp -R "${srcdir}/share/doc" "${pkgdir}/usr/share/"
}

sha256sums=('58e41af8f4691cf518d4204ad2b278abde9ff2139a54453d17bcb90a15d7e5b7')
