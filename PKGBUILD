# Maintainer: Keiran <keircn@proton.me>
pkgname=seanime-bin
pkgver=3.2.4
pkgrel=1
pkgdesc="A self-hosted server that seamlessly integrates with your local anime collection with anilist integration."
arch=(x86_64)
url="https://github.com/5rahim/seanime"
license=('MIT')
conflicts=()
depends=()
source=("https://github.com/5rahim/seanime/releases/download/v${pkgver}/seanime-${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('b81a011deb1c9045d6ec6a48abf23119f22c199db75c655c5348e18ec72dbe56')

package() {
  install -d "${pkgdir}/usr/bin"
  install -m755 "${srcdir}/seanime" "${pkgdir}/usr/bin/seanime"
}
