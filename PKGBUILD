# Maintainer: Ased Mammad <mammad.ased@gmail.com>
# Contributor: Lucas dos Santos Abreu <lucas.s.abreu@gmail.com>

pkgname=clockify-cli-bin
pkgver=0.38.4
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
source=("https://raw.githubusercontent.com/lucassabreu/clockify-cli/main/README.md")

sha256sums_aarch64=('ceee245111988e068b2ea50bb33d210b9adce30630a0b7665ee93eaf90dc6210')
sha256sums_i686=('cf2056a759fb015c6c5914b55e8c2d616ea12c9d3157bd998a669b7ef0f68bb8')
sha256sums_x86_64=('8b5861ccf6f321d79db13c04bc610feb69f5b462df0f79d386a189cd98254325')
sha256sums=(SKIP)

package() {
  install -Dm755 -t "${pkgdir}/usr/bin" \
      ./clockify-cli
  install -Dm644 ./LICENSE \
      "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 ./README.md \
      "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
