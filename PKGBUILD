pkgname=nettui-bin
pkgver=0.1.9
pkgrel=1
pkgdesc="Unified TUI for Wi-Fi and Ethernet"
arch=("x86_64")
url="https://github.com/skibidiandulka/nettui"
license=("GPL-3.0-only")
depends=("glibc" "gcc-libs")
provides=("nettui")
conflicts=("nettui" "nettui-git")
source=("nettui-v${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/nettui-v${pkgver}-x86_64.tar.gz")
sha256sums=("1d14702a22ee6b031f107832b8d9752e21f9d42e0c0b072aeac3021c04ea87ad")

package() {
  install -Dm755 "${srcdir}/nettui-v${pkgver}-x86_64/nettui" "${pkgdir}/usr/bin/nettui"
  install -Dm644 "${srcdir}/nettui-v${pkgver}-x86_64/README.md" "${pkgdir}/usr/share/doc/nettui/README.md"
  install -Dm644 "${srcdir}/nettui-v${pkgver}-x86_64/LICENSE" "${pkgdir}/usr/share/licenses/nettui/LICENSE"
  install -Dm644 "${srcdir}/nettui-v${pkgver}-x86_64/config/keybinds.toml.example" "${pkgdir}/usr/share/doc/nettui/keybinds.toml.example"
}
