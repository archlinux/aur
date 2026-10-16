pkgname=accio-bin
pkgver=0.0.10
pkgrel=1
pkgdesc="Switch your ai provider credentials and configurations. accio ai!"
arch=('x86_64')
url="https://github.com/nickheyer/accio"
license=('MIT')
provides=('accio')
conflicts=('accio')
source=("accio-${pkgver}-x86_64-linux.tar.gz::https://github.com/nickheyer/accio/releases/download/v${pkgver}/accio-${pkgver}-x86_64-linux.tar.gz")
sha256sums=('58b96b8d95fce4c10b655214a4a43b8b0d24a531df73f3d68840d0fc49f0647a')

package() {
  install -Dm755 "${srcdir}/accio" "${pkgdir}/usr/bin/accio"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
