#  Maintainer: Greg Flynn <gregflynn42 at gmail dot com>

pkgname="pulse-sms"
pkgver="1.0.0"
pkgrel=1
pkgdesc="A native desktop implementation of Pulse"
arch=('x86_64')
url="https://messenger.klinkerapps.com/"

_vername="$pkgver-rc${pkgrel}"
source=(
    "https://github.com/klinker-apps/messenger-issues/releases/download/v${_vername}/pulse-sms-${_vername}-amd64.deb"
)
sha512sums=("7f4c7a14e623f1dd199836a3cc461837859e09a2904ee5fc4ddc3fcaec41cd8f594aa3c99df81c9c4e4cd51b0dd7b14f1be18827cafee3b40ab7b1e4374c8ed6")

package() {
    tar -xvf data.tar.xz -C "$pkgdir"
}
