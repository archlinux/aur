# Maintainer: Zaid Ajo <zaidejjodev@gmail.com>
# Template — replace zaidejjo and sha256sums before publishing.

pkgname=omniapi-cli-bin
pkgver=1.0.8
pkgrel=1
pkgdesc="OmniAPI CLI — blazing-fast API client for CI/CD (standalone binary)"
arch=('x86_64')
url="https://github.com/zaidejjo/omniapi"
license=('MIT')
depends=()

# Standalone binary compiled with bun build --compile (no runtime deps)
source=("${url}/releases/download/v${pkgver}/oma-linux-x64")
sha256sums=('285e4efc4f3d267e2d55bef0ca3017959e951ad10c3d4fb6caebae4c8806e738')

package() {
  install -d "${pkgdir}/usr/bin"
  install -Dm755 "${srcdir}/oma-linux-x64" "${pkgdir}/usr/bin/oma"
}
