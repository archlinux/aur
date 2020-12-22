# Maintainer: f440 <freq440@gmail.com>

pkgname=lazygit-bin
pkgver=0.23.7
pkgrel=1
pkgdesc="simple terminal UI for git commands. Pre-compiled."
arch=('x86_64')
url="https://github.com/jesseduffield/lazygit"
license=('MIT')
depends=()
provides=('lazygit')
conflicts=('lazygit')

source=("${pkgname/-bin/}-${pkgver}_linux_amd64.zip::https://github.com/jesseduffield/lazygit/releases/download/v${pkgver}/${pkgname/-bin/}_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('84528f6c2d29e15d237bddd152d0cd59ddba0119f99413d37445ec39eedfe467')

package() {
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/lazygit/LICENSE"
  install -Dm644 "README.md" "${pkgdir}/usr/share/licenses/lazygit/README.md"
  install -Dm755 "lazygit" "${pkgdir}/usr/bin/lazygit"
}
