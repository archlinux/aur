# Maintainer: Sabit Maulana <sbtmul at gmail dot com>

pkgname=tab-rs-bin
_pkgname=tab-rs
pkgdesc='The intuitive config-driven terminal multiplexer'
pkgver=0.5.4
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
sha256sums=('751a589323a9bdd9352b5831c94ccaca0d4499d8f2ad720b2afaf31184512041')

package() {
    install -Dm755 "tab" "$pkgdir/usr/bin/tab"
}
