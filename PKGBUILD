# Maintainer: myuki <mioki dot cinnamon650 at 8shield dot net>

pkgname=mihomo-tui-bin
_pkgname=mihomo-tui
pkgver=0.6.1
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
sha256sums_x86_64=('43d7d0ee0a55692e3a3092db74faa8184e037bbe1ec7d49621a0c9271d3eb5ca')
sha256sums_aarch64=('3ca71fd7538d6c446a1c1d44a71aa0a3a9bff57c39fea69c226c156939d59327')

source_x86_64=("${_pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/potoo0/mihomo-tui/releases/download/v${pkgver}/mihomo-tui-Linux-gnu-x86_64.tar.gz")

source_aarch64=("${_pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/potoo0/mihomo-tui/releases/download/v${pkgver}/mihomo-tui-Linux-gnu-arm64.tar.gz")

package() {
  install -Dm755 "${_pkgname}" -t "${pkgdir}/usr/bin/"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
