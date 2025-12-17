# Maintainer: Keiran <keircn@proton.me>
pkgname=seanime-bin
pkgver=3.2.1
pkgrel=2
pkgdesc="A self-hosted server that seamlessly integrates with your local anime collection with anilist integration."
arch=(x86_64)
url="https://github.com/5rahim/seanime"
license=('MIT')
conflicts=()
depends=()
source=("https://github.com/5rahim/seanime/releases/download/v${pkgver}/seanime-${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('20d106e44d9a6f65faf1b96caaf2b277931d41379c9a2244aa4f5076ab0b6ccd')

package() {
  install -d "${pkgdir}/usr/bin"
  install -m755 "${srcdir}/seanime" "${pkgdir}/usr/bin/seanime"
}
