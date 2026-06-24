# Maintainer: deadnews <deadnewsgit@gmail.com>

name="imgup"
pkgname="${name}-bin"
pkgver="4.0.3"
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

sha256sums_x86_64=('0ae8b944a725130f66b905387839de089e79234f5c46b9eae344bbaf83dc019b')
sha256sums_aarch64=('2c967b1dd8dbb44d07071c5e8c3e18a0c7fac47850dc8a1639a5d8cc4f378b7c')

package() {
    install -Dm755 "${srcdir}/${name}" "${pkgdir}/usr/bin/${name}"
}
