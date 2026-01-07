# Maintainer: myuki <mioki dot cinnamon650 at 8shield dot net>

pkgname=mihomo-tui-bin
_pkgname=mihomo-tui
pkgver=0.2.2
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

source_x86_64=("${_pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/potoo0/mihomo-tui/releases/download/v${pkgver}/mihomo-tui-Linux-gnu-x86_64.tar.gz")
sha256sums_x86_64=('bd016247ad5e3be0be7f0fbfc9cfac128062275c44bd9363c62055294b36d8e5')

source_aarch64=("${_pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/potoo0/mihomo-tui/releases/download/v${pkgver}/mihomo-tui-Linux-gnu-arm64.tar.gz")
sha256sums_aarch64=('13b645eb628b2c7a56a53042986ca163f10cfba6928fdce6b336fe61af92db6b')

package() {
  install -Dm755 "${_pkgname}" -t "${pkgdir}/usr/bin/"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
