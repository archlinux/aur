# Maintainer: Simão Mata <git 0io.eu>

_RELEASES_URL="https://github.com/simao/jaxe/releases/download"

pkgname=jaxe-bin
pkgver=0.1.0
pkgrel=3
pkgdesc="jaxe parses new line delimited json and outputs a human readable representation"
arch=('x86_64')
url="https://github.com/simao/jaxe"
license=('MIT')
depends=()
groups=()
source_x86_64=("$_RELEASES_URL/v$pkgver/jaxe-linux-musl-x86_64")
sha256sums_x86_64=('e9d69f596bff9a3e928dd9ff48fb67f66730feafaeedf3b566b1ac4ac4268f69')

package() {
    install -D "$srcdir/jaxe-linux-musl-x86_64" "$pkgdir/usr/bin/jaxe"
}
