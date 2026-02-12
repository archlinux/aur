pkgname=nettui-bin
pkgver=0.1.6
pkgrel=1
pkgdesc="Unified TUI for Wi-Fi and Ethernet"
arch=("x86_64")
url="https://github.com/skibidiandulka/nettui"
license=("GPL-3.0-only")
depends=("glibc" "gcc-libs")
provides=("nettui")
conflicts=("nettui" "nettui-git")
source=("nettui-v${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/nettui-v${pkgver}-x86_64.tar.gz")
sha256sums=("f75d7314901aa6fdd3c94ce2f465ffb649bbbfedd6042b8290e4e851f5b544e6")

package() {
  install -Dm755 "${srcdir}/nettui-v${pkgver}-x86_64/nettui" "${pkgdir}/usr/bin/nettui"
  install -Dm644 "${srcdir}/nettui-v${pkgver}-x86_64/README.md" "${pkgdir}/usr/share/doc/nettui/README.md"
  install -Dm644 "${srcdir}/nettui-v${pkgver}-x86_64/config/keybinds.toml.example" "${pkgdir}/usr/share/doc/nettui/keybinds.toml.example"
}
