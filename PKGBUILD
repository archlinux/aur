# Maintainer: Roc Gwei <roc dot gui at foxmail dot com>

pkgname=codecrafters-bin
pkgver=44
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

sha256sums_x86_64=('7a58c5c8355fd272e84d0e04ace612a1085a7cb612230f9daf90d7e75354a60c')
sha256sums_aarch64=('ad5502c86919cccd870bda7f87ca7152a96b2df6be12cd17a8dc88394a2954ab')
sha256sums_i686=('1134794e8cf38eeb4bcecc5cf8dc9d33bd65e4e36863476c04980ea75cf1cc46')

package() {
  install -Dm755 codecrafters "$pkgdir/usr/bin/codecrafters"
}
