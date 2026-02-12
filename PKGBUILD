pkgname=nettui-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Unified TUI for Wi-Fi and Ethernet"
arch=("x86_64")
url="https://github.com/skibidiandulka/nettui"
license=("GPL-3.0-only")
depends=("glibc" "gcc-libs")
provides=("nettui")
conflicts=("nettui" "nettui-git")
source=("nettui-v${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/nettui-v${pkgver}-x86_64.tar.gz")
sha256sums=("d6e8b9b0c1057c2f0c4f7e4894449a990fa5c44799614a76a008c3f72a76491f")

package() {
  install -Dm755 "${srcdir}/nettui-v${pkgver}-x86_64/nettui" "${pkgdir}/usr/bin/nettui"
  install -Dm644 "${srcdir}/nettui-v${pkgver}-x86_64/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
