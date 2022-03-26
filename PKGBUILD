# Maintainer: Simão Mata <git 0io.eu>

_RELEASES_URL="https://github.com/simao/jaxe/releases/download"

pkgname=jaxe-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="jaxe parses new line delimited json and outputs a human readable representation"
arch=('x86_64')
url="https://github.com/simao/jaxe"
license=('MIT')
depends=('glibc')
groups=()
source_x86_64=("$_RELEASES_URL/v$pkgver/jaxe-linux-x86_64")
sha256sums_x86_64=('5cb3a8ab6893d22665cf94a68ce05979690b0fb9fe329227925b79d92a2e48d7')

package() {
    install -D "$srcdir/jaxe-linux-x86_64" "$pkgdir/usr/bin/jaxe"
}
