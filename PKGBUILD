pkgname=nettui-bin
pkgver=0.1.7
pkgrel=1
pkgdesc="Unified TUI for Wi-Fi and Ethernet"
arch=("x86_64")
url="https://github.com/skibidiandulka/nettui"
license=("GPL-3.0-only")
depends=("glibc" "gcc-libs")
provides=("nettui")
conflicts=("nettui" "nettui-git")
source=("nettui-v${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/nettui-v${pkgver}-x86_64.tar.gz")
sha256sums=("a20a3200fb380837610cc61581d80bbf7d284d46cbbea151da1cc0de5db6e170")

package() {
  install -Dm755 "${srcdir}/nettui-v${pkgver}-x86_64/nettui" "${pkgdir}/usr/bin/nettui"
  install -Dm644 "${srcdir}/nettui-v${pkgver}-x86_64/README.md" "${pkgdir}/usr/share/doc/nettui/README.md"
  install -Dm644 "${srcdir}/nettui-v${pkgver}-x86_64/LICENSE" "${pkgdir}/usr/share/licenses/nettui/LICENSE"
  install -Dm644 "${srcdir}/nettui-v${pkgver}-x86_64/config/keybinds.toml.example" "${pkgdir}/usr/share/doc/nettui/keybinds.toml.example"
}
