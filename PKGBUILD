# Maintainer: Ased Mammad <mammad.ased@gmail.com>
# Contributor: Lucas dos Santos Abreu <lucas.s.abreu@gmail.com>

pkgname=clockify-cli-bin
pkgver=0.32.2
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

sha256sums_aarch64=('213381cd03c3df8ca51b37b16b2fcc13fbb51d3a7e9d75f799c0ccac60744ce0  ')
sha256sums_i686=('958c533cfcdb517fd5395b10d2a8a0ae41e53ceab1d94229447e3eeba75a292b  ')
sha256sums_x86_64=('0029c47451e24699494d9b67b427cb3cf79588cac1d228827f41ee4101c74a1b  ')

package() {
  install -Dm755 -t "${pkgdir}/usr/bin" \
      ./clockify-cli
  install -Dm644 ./LICENSE \
      "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 ./README.md \
      "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
