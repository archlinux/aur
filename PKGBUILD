# Maintainer: Paul Delafosse <paul.delafosse@protonmail.com>
pkgname=bombadil-bin
pkgver=1.0.0
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
_bombadil_version='1.0.0'
source=("$pkgname-$pkgver.tar.gz::${url}/releases/download/${pkgver}/bombadil-${pkgver}-${CARCH}-unknown-linux-musl.tar.gz")
md5sums=('cd0fd91b1b7d0c65948bdeeec26a0189')

package() {
    # install the Rust binary
    install -Dm755 "${srcdir}/bombadil" "${pkgdir}/usr/bin/bombadil"
}
md5sums=('964bf5e4a7396caa0b86320c3c82c9cc')
