# Maintainer: Roc Gwei <roc dot gui at foxmail dot com>

pkgname=codecrafters-bin
pkgver=39
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

sha256sums_x86_64=('a37c09f6432d7276a240dabf25d4c7d3fa0df195a173046e8e4344463ed5c57d')
sha256sums_aarch64=('3b7d50fa9537fc936af17ae3bb095a2c18177aba4242590fa51fef4306f18aa7')
sha256sums_i686=('fa11412eeb8a8c3c17669744e9c831e36b42fc68eec0814358ab71317b583c46')

package() {
  install -Dm755 codecrafters "$pkgdir/usr/bin/codecrafters"
}
