# Maintainer: Paul Delafosse <paul.delafosse@protonmail.com>
pkgname=bombadil-bin
pkgver=2.2.4
pkgrel=1
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
md5sums=('57eb7e6d30307e13862183d11a1b2027')

package() {
    # install the Rust binary
    install -Dm755 "${srcdir}/bombadil" "${pkgdir}/usr/bin/bombadil"
}
