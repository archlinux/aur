pkgname=0xbin-cli
pkgver=0.1.2
pkgrel=1
pkgdesc='Fast command-line client for the ephemeral 0xbin paste service'
arch=('x86_64')
url='https://github.com/0atxl/0xbin-cli'
license=('MIT')
depends=('gcc-libs')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/0xbin-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('393d002ab2e1a6e8ce0e93b9d37e565d1ee19041aae9bb6d257940e2ad7c391e')

package() {
  local archive_dir="0xbin-v${pkgver}-x86_64-unknown-linux-gnu"
  install -Dm755 "${archive_dir}/0xbin" "${pkgdir}/usr/bin/0xbin"
  install -Dm644 "${archive_dir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
