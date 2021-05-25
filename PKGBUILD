# Maintainer: Paul Delafosse <paul.delafosse@protonmail.com>
pkgname=bombadil-bin
pkgver=2.0.0
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
install=bombadil.install
bombadil_version="$pkgver"
source=("$pkgname-$pkgver.tar.gz::${url}/releases/download/${bombadil_version}/bombadil-${bombadil_version}-${CARCH}-unknown-linux-musl.tar.gz")
md5sums=('9b43775568958567a2c8f312bca2a674')

package() {
    # install the Rust binary
    install -Dm755 "${srcdir}/bombadil" "${pkgdir}/usr/bin/bombadil"
}
