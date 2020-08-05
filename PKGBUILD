# Maintainer: Paul Delafosse <paul.delafosse@protonmail.com>
pkgname=bombadil-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="A dotfile template manager"
arch=('x86_64')
url="https://github.com/oknozor/toml-bombadil"
license=('MIT')
conflicts=()
provides=()
depends=()
makedepends=()
options=()
install=
_bombadil_version='0.1.0'
source=("$pkgname-$pkgver.tar.gz::${url}/releases/download/${pkgver}/bombadil-${pkgver}-${CARCH}-unknown-linux-musl.tar.gz")
md5sums=('cd0fd91b1b7d0c65948bdeeec26a0189')

package() {
    # install the Rust binary
    install -Dm755 "${srcdir}/bombadil" "${pkgdir}/usr/bin/bombadil"
}
