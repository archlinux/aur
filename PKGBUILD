# Maintainer: f440 <freq440@gmail.com>

pkgname=lazygit-bin
pkgver=0.27.2
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

sha256sums_x86_64=('5a8dbaa039bac07776feeca2f2844632b7638760cb002cb0082b56b04cfab875')
sha256sums_armv6h=('d4d3ae6a1192ed1205000548569001fb0bf036f801a17fbf04be8c35f2d3baa8')
sha256sums_aarch64=('26ffa9855973050dba27a64828f9fdbac41dfcc6e49b9d340a32e2d880e7ac2a')

package() {
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/lazygit/LICENSE"
  install -Dm644 "README.md" "${pkgdir}/usr/share/licenses/lazygit/README.md"
  install -Dm755 "lazygit" "${pkgdir}/usr/bin/lazygit"
}
