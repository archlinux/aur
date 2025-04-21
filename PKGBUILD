# Maintainer: Ased Mammad <mammad.ased@gmail.com>
# Contributor: Lucas dos Santos Abreu <lucas.s.abreu@gmail.com>

pkgname=clockify-cli-bin
pkgver=0.54.0
pkgrel=1
license=('Apache')
pkgdesc="A simple cli to manage your time entries on Clockify from terminal"
depends=()
makedepends=()
provides=('clockify-cli')
arch=('aarch64' 'i686' 'x86_64')
url="https://github.com/lucassabreu/clockify-cli"
source_aarch64=("$pkgname-v$pkgver.tar.gz::https://github.com/lucassabreu/clockify-cli/releases/download/v$pkgver/clockify-cli_Linux_arm64.tar.gz")
source_i686=("$pkgname-v$pkgver.tar.gz::https://github.com/lucassabreu/clockify-cli/releases/download/v$pkgver/clockify-cli_Linux_i386.tar.gz")
source_x86_64=("$pkgname-v$pkgver.tar.gz::https://github.com/lucassabreu/clockify-cli/releases/download/v$pkgver/clockify-cli_Linux_x86_64.tar.gz")
source=("https://raw.githubusercontent.com/lucassabreu/clockify-cli/main/README.md")

sha256sums_aarch64=('405578b2df937ea957523527efd72a4806f62c03f5a5f1704fc5e242c2c9677f')
sha256sums_i686=('31dc686ef92b325af48e46cffdf65bff2de2cef8bc2387b052e75e289050cb2f')
sha256sums_x86_64=('c457b8d42900075a0a2ec7d72bf0ef76b3b7ca4c7ff7c4bc5541c688db5c62dd')
sha256sums=(SKIP)

package() {
  install -Dm755 -t "${pkgdir}/usr/bin" \
    ./clockify-cli
  install -Dm644 ./LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 ./README.md \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
