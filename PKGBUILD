# Maintainer: Qualeko qualeko@protonmail.com
pkgname=seanime-bin
pkgver=2.8.4
pkgrel=2
pkgdesc="A self-hosted server that seamlessly integrates with your local anime collection with anilist integration."
arch=(x86_64)
url="https://github.com/5rahim/seanime"
license=('MIT')
conflicts=()
depends=()
source=("https://github.com/5rahim/seanime/releases/download/v${pkgver}/seanime-${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('623b7e3aae3640c7781fa32dcd995268361abf910439a9189164c2c73c9cf0ce')

package() {
  install -d "${pkgdir}/usr/bin"
  install -m755 "${srcdir}/seanime" "${pkgdir}/usr/bin/seanime"
}
