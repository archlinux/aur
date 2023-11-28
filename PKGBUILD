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
sha256sums_x86_64=('d5cbb5a2f0f2ec7062c434bf10a80e56505a478abfdd94b8f39d23eb81b6b03f')

prepare() {
  chmod +x dt
}

package() {
  mkdir -p "${pkgdir}/usr/local/bin/"
  cp "${srcdir}/dt" "${pkgdir}/usr/local/bin/dt"
}
