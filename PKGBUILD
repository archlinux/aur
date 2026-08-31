pkgname=accio-bin
pkgver=0.0.4
pkgrel=1
pkgdesc="Switch your ai provider credentials and configurations. accio ai!"
arch=('x86_64')
url="https://github.com/nickheyer/accio"
license=('MIT')
provides=('accio')
conflicts=('accio')
source=("accio-${pkgver}-x86_64-linux.tar.gz::https://github.com/nickheyer/accio/releases/download/v${pkgver}/accio-${pkgver}-x86_64-linux.tar.gz")
sha256sums=('efaa301fe9ad0ab8e8b4650729596b9140b496c39c7634148136781f7e7ad7cc')

package() {
  install -Dm755 "${srcdir}/accio" "${pkgdir}/usr/bin/accio"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
