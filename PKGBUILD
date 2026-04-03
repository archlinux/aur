# Maintainer: deadnews <deadnewsgit@gmail.com>

name="imgup"
pkgname="${name}-bin"
pkgver="4.0.0_alpha.5"
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

sha256sums_x86_64=('f0a6cee9d59ba637dd70103f525e3966af8e936c32e5f534bdd11e2dc8f96c0f')
sha256sums_aarch64=('8486064f6894beab993693212f73d9cc8bbb21a8251fd82a50bf273e8305a6c8')

package() {
    install -Dm755 "${srcdir}/${name}" "${pkgdir}/usr/bin/${name}"
}
