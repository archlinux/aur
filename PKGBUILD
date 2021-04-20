# Maintainer: f440 <freq440@gmail.com>

pkgname=lazygit-bin
pkgver=0.28.1
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

sha256sums_x86_64=('413f3fa7db318124947a5170420a7f6aa6dd5c261639c19ecd84e99774620ae6')
sha256sums_armv6h=('aaed49194cd3d413b0953367c037ec907f74b91121221df60c367d05288b29e1')
sha256sums_aarch64=('2e99f0a96e3577a24769adbf8af70b3c023c85c50416543fa6af239754961e1d')

package() {
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/lazygit/LICENSE"
  install -Dm644 "README.md" "${pkgdir}/usr/share/licenses/lazygit/README.md"
  install -Dm755 "lazygit" "${pkgdir}/usr/bin/lazygit"
}
