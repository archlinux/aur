pkgname=accio-bin
pkgver=0.0.9
pkgrel=1
pkgdesc="Switch your ai provider credentials and configurations. accio ai!"
arch=('x86_64')
url="https://github.com/nickheyer/accio"
license=('MIT')
provides=('accio')
conflicts=('accio')
source=("accio-${pkgver}-x86_64-linux.tar.gz::https://github.com/nickheyer/accio/releases/download/v${pkgver}/accio-${pkgver}-x86_64-linux.tar.gz")
sha256sums=('95f823d7da7a6dc886fa668351442ad0ad0503e4a01f14604789525cf29f4187')

package() {
  install -Dm755 "${srcdir}/accio" "${pkgdir}/usr/bin/accio"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
