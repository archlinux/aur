# Maintainer: devnullvoid <devnullvoid.space@gmail.com>
pkgname=cftui-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="A terminal user interface (TUI) for managing Cloudflare DNS records (binary)"
arch=("x86_64" "aarch64")
url="https://github.com/devnullvoid/cloudflare-tui"
license=("MIT")
depends=("glibc")
provides=("cftui")
conflicts=("cftui" "cftui-git")
source_x86_64=("cftui_Linux_x86_64.tar.gz::${url}/releases/download/v${pkgver}/cftui_Linux_x86_64.tar.gz")
source_aarch64=("cftui_Linux_arm64.tar.gz::${url}/releases/download/v${pkgver}/cftui_Linux_arm64.tar.gz")
sha256sums_x86_64=("SKIP")
sha256sums_aarch64=("SKIP")

package() {
  install -Dm755 "cftui" "${pkgdir}/usr/bin/cftui"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/cftui/LICENSE"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/cftui/README.md"
}
