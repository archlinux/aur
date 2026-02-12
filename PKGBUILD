pkgname=nettui-bin
pkgver=0.1.10
pkgrel=1
pkgdesc="Unified TUI for Wi-Fi and Ethernet"
arch=("x86_64")
url="https://github.com/skibidiandulka/nettui"
license=("GPL-3.0-only")
depends=("glibc" "gcc-libs")
provides=("nettui")
conflicts=("nettui" "nettui-git")
source=("nettui-v${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/nettui-v${pkgver}-x86_64.tar.gz")
sha256sums=("e3d3ac6b35ccc1dcd074ee7d59d73d57e9e106e894c34a0387c9dbd7dad6c9dd")

package() {
  install -Dm755 "${srcdir}/nettui-v${pkgver}-x86_64/nettui" "${pkgdir}/usr/bin/nettui"
  install -Dm644 "${srcdir}/nettui-v${pkgver}-x86_64/README.md" "${pkgdir}/usr/share/doc/nettui/README.md"
  install -Dm644 "${srcdir}/nettui-v${pkgver}-x86_64/LICENSE" "${pkgdir}/usr/share/licenses/nettui/LICENSE"
  install -Dm644 "${srcdir}/nettui-v${pkgver}-x86_64/config/keybinds.toml.example" "${pkgdir}/usr/share/doc/nettui/keybinds.toml.example"
}
