pkgname=accio-bin
pkgver=0.0.6
pkgrel=1
pkgdesc="Switch your ai provider credentials and configurations. accio ai!"
arch=('x86_64')
url="https://github.com/nickheyer/accio"
license=('MIT')
provides=('accio')
conflicts=('accio')
source=("accio-${pkgver}-x86_64-linux.tar.gz::https://github.com/nickheyer/accio/releases/download/v${pkgver}/accio-${pkgver}-x86_64-linux.tar.gz")
sha256sums=('7d3f8765747d4f436a7b2d2996026e8803e570e079dba180ec26c5bdf6bb6e47')

package() {
  install -Dm755 "${srcdir}/accio" "${pkgdir}/usr/bin/accio"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
