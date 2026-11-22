# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=oeis-tui-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="A TUI and CLI for browsing the On-Line Encyclopedia of Integer Sequences (OEIS) in the terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/hako/oeis-tui"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/oeis-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/oeis-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('fdd05624601714cfcf5c1edae40b415668a6b69e9d6df5ebd31648621676c6d8')
sha256sums_aarch64=('ea6ca42cc4c8f2c90d97a0c8ea9ede14f3e5bfc65e5e12144545636c8199c24e')

package() {
  install -Dm755 "oeis" "${pkgdir}/usr/bin/oeis"
}
