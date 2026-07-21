# Maintainer: Zaid Ajo <zaidejjodev@gmail.com>
# Template — replace zaidejjo and sha256sums before publishing.

pkgname=omniapi-cli-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="OmniAPI CLI — blazing-fast API client for CI/CD (standalone binary)"
arch=('x86_64')
url="https://github.com/zaidejjo/omniapi"
license=('MIT')
depends=()

# Standalone binary compiled with bun build --compile (no runtime deps)
source=("${url}/releases/download/v${pkgver}/oma-linux-x64")
sha256sums=('SKIP')   # TODO: replace after `makepkg -g`

package() {
  install -d "${pkgdir}/usr/bin"
  install -Dm755 "${srcdir}/oma-linux-x64" "${pkgdir}/usr/bin/oma"
}
