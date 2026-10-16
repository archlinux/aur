pkgname=accio-bin
pkgver=0.0.8
pkgrel=1
pkgdesc="Switch your ai provider credentials and configurations. accio ai!"
arch=('x86_64')
url="https://github.com/nickheyer/accio"
license=('MIT')
provides=('accio')
conflicts=('accio')
source=("accio-${pkgver}-x86_64-linux.tar.gz::https://github.com/nickheyer/accio/releases/download/v${pkgver}/accio-${pkgver}-x86_64-linux.tar.gz")
sha256sums=('45e1ba33d37bdaf44f7f871e50443d245d30400d1f706b1a86426d38d3bbc929')

package() {
  install -Dm755 "${srcdir}/accio" "${pkgdir}/usr/bin/accio"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
