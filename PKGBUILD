# Maintainer: Ased Mammad <mammad.ased@gmail.com>
# Contributor: Lucas dos Santos Abreu <lucas.s.abreu@gmail.com>

pkgname=clockify-cli-bin
pkgver=0.24.0
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

sha256sums_aarch64=('d9471cd2fe2d9cc2471f20235f89a57935ce15db21bc614f98b108bec576baa5')
sha256sums_i686=('7855668cdb43939621d3d0c299ac2e445381c4a78e90fc70f4cc28d39f5034df')
sha256sums_x86_64=('3f007c91262ff69b5e86da91fc31e7e21f3440871795c3d2f419b1b5faaad787')

package() {
  install -Dm755 -t "${pkgdir}/usr/bin" \
      ./clockify-cli
  install -Dm644 ./LICENSE \
      "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 ./README.md \
      "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
