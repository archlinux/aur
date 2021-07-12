# Maintainer: Ased Mammad <mammad.ased@gmail.com>
# Contributor: Lucas dos Santos Abreu <lucas.s.abreu@gmail.com>

pkgname=clockify-cli-bin
pkgver=0.18.0
pkgrel=1
license=('Apache')
pkgdesc="A simple cli to manage your time entries on Clockify from terminal"
depends=()
makedepends=()
provides=('clockify-cli')
arch=('aarch64' 'i686' 'x86_64')
url="https://github.com/lucassabreu/clockify-cli"
source_aarch64=("$pkgname-v$pkgver.tar.gz::https://github.com/lucassabreu/clockify-cli/releases/download/v$pkgver/clockify-cli_${pkgver}_Linux_arm64.tar.gz")
source_i686=("$pkgname-v$pkgver.tar.gz::https://github.com/lucassabreu/clockify-cli/releases/download/v$pkgver/clockify-cli_${pkgver}_Linux_i386.tar.gz")
source_x86_64=("$pkgname-v$pkgver.tar.gz::https://github.com/lucassabreu/clockify-cli/releases/download/v$pkgver/clockify-cli_${pkgver}_Linux_x86_64.tar.gz")

sha256sums_aarch64=('ce0281f38d680080c04b8381df3534f8e0db35c8d4eec2532fa5c0d7175368f7')
sha256sums_i686=('58c34548e482f1cbbd0314799e436759e2b089d5fda4eb522dfd20fea4ed3e78')
sha256sums_x86_64=('97bfaa6919cb5faaaac7f9ea071bcd1aa724b595eee5bbe5793a7e5f593d59da')

package() {
  install -Dm755 -t "${pkgdir}/usr/bin" \
      ./clockify-cli
  install -Dm644 ./LICENSE \
      "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 ./README.md \
      "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
