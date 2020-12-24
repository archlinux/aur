# Maintainer: f440 <freq440@gmail.com>

pkgname=lazygit-bin
pkgver=0.24.2
pkgrel=1
pkgdesc="simple terminal UI for git commands. Pre-compiled."
arch=('x86_64')
url="https://github.com/jesseduffield/lazygit"
license=('MIT')
depends=()
provides=('lazygit')
conflicts=('lazygit')

source=("${pkgname/-bin/}-${pkgver}_Linux_x86_64.tar.gz::https://github.com/jesseduffield/lazygit/releases/download/v${pkgver}/${pkgname/-bin/}_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('5db522b286700a099db22a2853500d0c53a77392acaefb30214cf01ed78fcc97')

package() {
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/lazygit/LICENSE"
  install -Dm644 "README.md" "${pkgdir}/usr/share/licenses/lazygit/README.md"
  install -Dm755 "lazygit" "${pkgdir}/usr/bin/lazygit"
}
