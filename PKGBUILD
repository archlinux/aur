# Maintainer: deadnews <deadnewsgit@gmail.com>

name="imgup"
pkgname="${name}-bin"
pkgver="4.0.2"
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

sha256sums_x86_64=('5a30fb5ba405628123245cc4f484254534f2403869d4b8fc1a3fac1584ac14b3')
sha256sums_aarch64=('756089f6a6498f0d37949d070ff3c62caedd23f59e2c44edcc75239c1b1b378a')

package() {
    install -Dm755 "${srcdir}/${name}" "${pkgdir}/usr/bin/${name}"
}
