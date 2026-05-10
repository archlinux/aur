# Maintainer: Roc Gwei <roc dot gui at foxmail dot com>

pkgname=codecrafters-bin
pkgver=54
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

sha256sums_x86_64=('777c74ee537570c7c054c2e1bbab0ce52b37157410d9bba1637d2ec8f8fbb4b8')
sha256sums_aarch64=('6bf4a0e632cc5b313c3b8245e6d0c2ead5068d46c3831c3a567102ab254fea57')
sha256sums_i686=('766d85a42e3201faef6226d41ba90568899f73967807d56d46caf55d0b0c0482')

package() {
  install -Dm755 codecrafters "$pkgdir/usr/bin/codecrafters"
}
