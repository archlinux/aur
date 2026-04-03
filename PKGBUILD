# Maintainer: deadnews <deadnewsgit@gmail.com>

name="imgup"
pkgname="${name}-bin"
pkgver="4.0.0"
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

sha256sums_x86_64=('c15571534203d4f65abd58060261e33a92b485fb4b44c3bb1edd17e449e734bd')
sha256sums_aarch64=('f6f423a2e67a4e10a8d2e92e61f2772cf98bda019c766bd6c037d96b915e8780')

package() {
    install -Dm755 "${srcdir}/${name}" "${pkgdir}/usr/bin/${name}"
}
