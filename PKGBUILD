# Maintainer: myuki <mioki dot cinnamon650 at 8shield dot net>

pkgname=mihomo-tui-bin
_pkgname=mihomo-tui
pkgver=0.5.1
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
sha256sums_x86_64=('e18fb1615d61c098cf66f8c07259916efb5ce935adb4b5f8444a59ae5bfa3c0c')
sha256sums_aarch64=('d2c9633f8ec3a3e3dd6d96dcb3f5c8fde97748f4d918b63970b949ceec0d25c6')

source_x86_64=("${_pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/potoo0/mihomo-tui/releases/download/v${pkgver}/mihomo-tui-Linux-gnu-x86_64.tar.gz")

source_aarch64=("${_pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/potoo0/mihomo-tui/releases/download/v${pkgver}/mihomo-tui-Linux-gnu-arm64.tar.gz")

package() {
  install -Dm755 "${_pkgname}" -t "${pkgdir}/usr/bin/"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
