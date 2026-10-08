# Maintainer: myuki <mioki dot cinnamon650 at 8shield dot net>

pkgname=mihomo-tui-bin
_pkgname=mihomo-tui
pkgver=0.5.3
pkgrel=1
pkgdesc="A TUI for Mihomo (Clash.Meta) - binary version"
arch=('x86_64' 'aarch64')
url="https://github.com/potoo0/mihomo-tui"
license=('MIT')
provides=("$_pkgname")
conflicts=("$_pkgname")
optdepends=('mihomo: Another Clash Kernel by MetaCubeX')
options=('!debug')
source=("LICENSE::https://github.com/potoo0/mihomo-tui/raw/main/LICENSE")
sha256sums=('0eff19db888c403ba4f5a035dbf50a64604110fe94d5b4b5365768af73bf2f0d')
sha256sums_x86_64=('b2e8d586f104a686c44306575f7698661ee23a1c6da2fbbb7d1f9d4c35ee5276')
sha256sums_aarch64=('1ab2a068261e9279715e91a6eee49ca6f58b6db8c82b524d5e85861ebc5af03b')

source_x86_64=("${_pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/potoo0/mihomo-tui/releases/download/v${pkgver}/mihomo-tui-Linux-gnu-x86_64.tar.gz")

source_aarch64=("${_pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/potoo0/mihomo-tui/releases/download/v${pkgver}/mihomo-tui-Linux-gnu-arm64.tar.gz")

package() {
  install -Dm755 "${_pkgname}" -t "${pkgdir}/usr/bin/"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
