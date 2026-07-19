# Maintainer: brianmatzelle <bmatzelle12@gmail.com>
pkgname=bookokrat-bin
pkgver=0.3.12
pkgrel=1
pkgdesc="Terminal-based EPUB and PDF reader with rich TUI"
arch=('x86_64' 'aarch64')
url="https://github.com/bugzmanov/bookokrat"
license=('AGPL-3.0-only')
depends=('fontconfig' 'gcc-libs' 'glibc')
provides=('bookokrat')
conflicts=('bookokrat')

source_x86_64=(
  "https://github.com/bugzmanov/bookokrat/releases/download/v${pkgver}/bookokrat-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz"
)
source_aarch64=(
  "https://github.com/bugzmanov/bookokrat/releases/download/v${pkgver}/bookokrat-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz"
)
sha256sums_x86_64=('fa7091a3482c00e723a327146b5d256559282be783ac7e0b82f4b408563760f3')
sha256sums_aarch64=('114739619aa85051566358fb2fc3c36840d2e77920a80b8d7310b15465089676')

package() {
  install -Dm755 bookokrat "${pkgdir}/usr/bin/bookokrat"
}
