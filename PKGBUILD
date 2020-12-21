# Maintainer: Sabit Maulana <sbtmul at gmail dot com>

pkgname=tab-rs-bin
_pkgname=tab-rs
pkgdesc='The intuitive config-driven terminal multiplexer'
pkgver=0.5.3
epoch=1
pkgrel=1
arch=('x86_64')
url='https://github.com/austinjones/tab-rs'
license=('MIT')
depends=()
optdepends=()
makedepends=()
checkdepends=()
provides=('tab-rs')
conflicts=('tab' 'tab-rs')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/tab-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('4a52e4077b11ba9139528c321b6ea1df70428f879cae1046a4da50bef84c744a')

package() {
    install -Dm755 "tab" "$pkgdir/usr/bin/tab"
}
