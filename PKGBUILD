# Maintainer: Keiran <keircn@proton.me>
pkgname=seanime-bin
pkgver=3.2.3
pkgrel=1
pkgdesc="A self-hosted server that seamlessly integrates with your local anime collection with anilist integration."
arch=(x86_64)
url="https://github.com/5rahim/seanime"
license=('MIT')
conflicts=()
depends=()
source=("https://github.com/5rahim/seanime/releases/download/v${pkgver}/seanime-${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('1d7e2590cffbe7501bc8ce4a829a2411fd43f1c48a05a846a7a119ca5ef64623')

package() {
  install -d "${pkgdir}/usr/bin"
  install -m755 "${srcdir}/seanime" "${pkgdir}/usr/bin/seanime"
}
