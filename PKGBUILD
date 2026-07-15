# Maintainer: Hugo <hugo@cluion.com>
pkgname=mogura-bin
pkgver=0.8.2
pkgrel=1
pkgdesc="Interactive disk cleaner and analyzer for Linux — dig out caches, build artifacts and orphaned configs"
arch=('x86_64' 'aarch64')
url="https://github.com/cluion/Mogura"
license=('MIT')
provides=('mogura')
conflicts=('mogura')
source_x86_64=("${url}/releases/download/v${pkgver}/mogura_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/mogura_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('fdc1b1d8af3772e1e9e17cd04c440b247b99606735edf9f31f34be22af843129')
sha256sums_aarch64=('e954fde5d40ba489d2fae0fca0970d49f5175241c5028f6103938e897c22014e')

package() {
  install -Dm755 mogura "${pkgdir}/usr/bin/mogura"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
