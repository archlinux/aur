# Maintainer: Paul Delafosse <paul.delafosse@protonmail.com>
pkgname=bombadil-bin
pkgver=2.1.0
pkgrel=2
pkgdesc="A dotfile template manager"
arch=('x86_64')
url="https://github.com/oknozor/toml-bombadil"
license=('MIT')
conflicts=()
provides=('bombadil')
depends=()
makedepends=()
options=()
install=bombadil.install
bombadil_version="$pkgver"
source=("$pkgname-$pkgver.tar.gz::${url}/releases/download/${bombadil_version}/bombadil-${bombadil_version}-${CARCH}-unknown-linux-musl.tar.gz")
md5sums=('33ef4bc2040a9388b8cdafa94074b253')

package() {
    # install the Rust binary
    install -Dm755 "${srcdir}/bombadil" "${pkgdir}/usr/bin/bombadil"
}
