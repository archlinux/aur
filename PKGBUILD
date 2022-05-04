# Maintainer: Ased Mammad <mammad.ased@gmail.com>
# Contributor: Lucas dos Santos Abreu <lucas.s.abreu@gmail.com>

pkgname=clockify-cli-bin
pkgver=0.35.1
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

sha256sums_aarch64=('ae763626dfcb72c24a27d4c4f1c4701a1ae6d04e80b27021e8238849cfa1aa03')
sha256sums_i686=('df5471dc0b6769de911e557dc36662b47e46b3f865a155a1c7481ada1e17e30f')
sha256sums_x86_64=('c79bb5a8dcd958abed04fcb53bf78a929a3ac6dfe9160189d5dd6b88651bc127')

package() {
  install -Dm755 -t "${pkgdir}/usr/bin" \
      ./clockify-cli
  install -Dm644 ./LICENSE \
      "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 ./README.md \
      "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
