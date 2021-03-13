# Maintainer: f440 <freq440@gmail.com>

pkgname=lazygit-bin
pkgver=0.26
pkgrel=1
pkgdesc="simple terminal UI for git commands. Pre-compiled."
arch=('x86_64' 'armv6h' 'aarch64')
url="https://github.com/jesseduffield/lazygit"
license=('MIT')
depends=()
provides=('lazygit')
conflicts=('lazygit')

source_x86_64=("${pkgname/-bin/}-${pkgver}_Linux_x86_64.tar.gz::https://github.com/jesseduffield/lazygit/releases/download/v${pkgver}/${pkgname/-bin/}_${pkgver}_Linux_x86_64.tar.gz")
source_armv6h=("${pkgname/-bin/}-${pkgver}_Linux_armv6.tar.gz::https://github.com/jesseduffield/lazygit/releases/download/v${pkgver}/${pkgname/-bin/}_${pkgver}_Linux_armv6.tar.gz")
source_aarch64=("${pkgname/-bin/}-${pkgver}_Linux_armv6.tar.gz::https://github.com/jesseduffield/lazygit/releases/download/v${pkgver}/${pkgname/-bin/}_${pkgver}_Linux_aarch64.tar.gz")

sha256sums_x86_64=('a9a7d8ac10bb05bfd12ff554e401c6d37e80ca9c24dabec487a56be90e96ef07')
sha256sums_armv6h=('aeff0c316326c3740f49158873b33eef63649e46de20fd9629629d5e4c3c8d3f')
sha256sums_aarch64=('1d018bfd4668ec7dd72b0f7708ebeefdb7fc09ea02a40706933ac60e63214871')

package() {
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/lazygit/LICENSE"
  install -Dm644 "README.md" "${pkgdir}/usr/share/licenses/lazygit/README.md"
  install -Dm755 "lazygit" "${pkgdir}/usr/bin/lazygit"
}
