# Maintainer: Amolith <amolith@secluded.site>
pkgname="dotree-bin"
pkgver=0.8.2
_pkgid="${pkgname%-bin}-${pkgver}"
pkgrel=1
pkgdesc="A small, interactive command runner"
arch=('x86_64')
url="https://github.com/KnorrFG/dotree"
license=('GPL-3.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

source_x86_64=("dt"::"${url}/releases/download/${pkgver}/dt")
sha256sums_x86_64=('8ab408801272c728300ac18926e4e1a991d7d38249c1f96fccb405e5d5d1594a')

prepare() {
  chmod +x dt
}

package() {
  mkdir -p "${pkgdir}/usr/local/bin/"
  cp "${srcdir}/dt" "${pkgdir}/usr/local/bin/dt"
}
