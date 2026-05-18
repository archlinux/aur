# Maintainer: Rick van Lieshout <info@rickvanlieshout.com>

pkgname=bun-deploy-to-aur-test-bin
pkgver=0.0.1
pkgrel=1
pkgdesc="Minimal package used to test GitHub Actions publishing to the AUR"
arch=(any)
url="https://github.com/Mastermindzh/bun-deploy-to-aur-test"
license=('MIT')
depends=(sh)
provides=(bun-deploy-to-aur-test)
conflicts=(bun-deploy-to-aur-test)
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/Mastermindzh/bun-deploy-to-aur-test/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('SKIP')

package() {
  install -Dm755 "${srcdir}/bun-deploy-to-aur-test-${pkgver}/bin/bun-deploy-to-aur-test"     "${pkgdir}/usr/bin/bun-deploy-to-aur-test"
}
