# Maintainer: Roc Gwei <roc dot gui at foxmail dot com>

pkgname=codecrafters-bin
pkgver=38
pkgrel=1
pkgdesc="Codecragers CLI tool (binary release)"
arch=('x86_64' 'aarch64' 'i686')
url="https://github.com/codecrafters-io/cli"
license=('MIT')
options=('!strip')
depends=()
provides=('codecrafters')
conflicts=()

source_x86_64=("${url}/releases/download/v${pkgver}/v${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/v${pkgver}_linux_arm64.tar.gz")
source_i686=("${url}/releases/download/v${pkgver}/v${pkgver}_linux_386.tar.gz")

sha256sums_x86_64=('ac655f06929741a11570f12d5a9de15c2ccb4b7fc8212d7aba7955a647947904')
sha256sums_aarch64=('d9305230229a44a2b815fe3ea35e1e2962c2dfc051cba8e90fd5270cd8c2732a')
sha256sums_i686=('28e9cb1c42f30f79650432d368213c17b15f858321a16d8b4847460bf850437f')

package() {
  install -Dm755 codecrafters "$pkgdir/usr/bin/codecrafters"
}
