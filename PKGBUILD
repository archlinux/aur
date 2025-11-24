# Maintainer: Qualeko qualeko@protonmail.com
pkgname=seanime-bin
pkgver=3.0.8
pkgrel=1
pkgdesc="A self-hosted server that seamlessly integrates with your local anime collection with anilist integration."
arch=(x86_64)
url="https://github.com/5rahim/seanime"
license=('MIT')
conflicts=()
depends=()
source=("https://github.com/5rahim/seanime/releases/download/v${pkgver}/seanime-${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('d25f4d0ba4ecf6bf1d188d0f981553fcce151d3c72456981ef4884c7b6016e7d')

package() {
  install -d "${pkgdir}/usr/bin"
  install -m755 "${srcdir}/seanime" "${pkgdir}/usr/bin/seanime"
}
