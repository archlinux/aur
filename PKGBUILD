# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=lilypond-docs
pkgver=2.24.1
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

sha256sums=('dc7b8d9cd86c435a3a3a5e6020869bf0d0507655e0c0a363a145d664391ddd18')
