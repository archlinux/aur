# Maintainer: deadnews <deadnewsgit@gmail.com>

name="imgup"
pkgname="${name}-bin"
pkgver="4.1.0"
pkgrel=1
pkgdesc="Upload images via APIs"
arch=("x86_64" "aarch64")
url="https://github.com/deadnews/imgup"
license=("MIT")
provides=("${name}")
conflicts=("${name}")
options=("!strip")

source_x86_64=("${name}-x86_64-unknown-linux-gnu.tar.gz::${url}/releases/download/v${pkgver//_/-}/${name}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${name}-aarch64-unknown-linux-gnu.tar.gz::${url}/releases/download/v${pkgver//_/-}/${name}-aarch64-unknown-linux-gnu.tar.gz")

sha256sums_x86_64=('eb265406f4b9415aed99089196aa7e1817b66634f4ffff5a8e564c720fe660cf')
sha256sums_aarch64=('43cc4ffa4a9190dd25a79892bd99d4be68b27b1dfe8b31255a22bcd846d5e753')

package() {
    install -Dm755 "${srcdir}/${name}" "${pkgdir}/usr/bin/${name}"
}
