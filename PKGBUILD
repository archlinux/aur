# Maintainer: f440 <freq440@gmail.com>

pkgname=lazygit-bin
pkgver=0.26.1
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

sha256sums_x86_64=('56416ca01937c283d6b2338e880137109c63332c5f22681f5aba98dc50e9e225')
sha256sums_armv6h=('e41a1911c1aa6e3ae02fcfdc2cb41d49e98b8fd7acabbc77ca15e368b323721a')
sha256sums_aarch64=('3d7136471d3e4f431be3854b5768cb7e8567f4d01abc94a5e643934fdcb73da4')

package() {
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/lazygit/LICENSE"
  install -Dm644 "README.md" "${pkgdir}/usr/share/licenses/lazygit/README.md"
  install -Dm755 "lazygit" "${pkgdir}/usr/bin/lazygit"
}
