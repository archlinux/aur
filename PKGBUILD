# Maintainer: Sabit Maulana <sbtmul at gmail dot com>

pkgname=tab-rs-bin
_pkgname=tab-rs
pkgdesc='The intuitive config-driven terminal multiplexer'
pkgver=0.5.7
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
sha256sums=('e21725361e094d36aed3344c2beeb8f8eee85f937dd2a3eaf8af4cdd62d80ad8')

package() {
    install -Dm755 "tab" "$pkgdir/usr/bin/tab"
}
