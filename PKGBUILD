# Maintainer: deadnews <deadnewsgit@gmail.com>

name="pindock"
pkgname="${name}-bin"
pkgver="1.1.0"
pkgrel=1
pkgdesc="Pin and update Docker image digests in Dockerfiles and compose files"
arch=("x86_64" "aarch64")
url="https://github.com/deadnews/pindock"
license=("MIT")
provides=("${name}")
conflicts=("${name}")
options=("!strip")

source_x86_64=("${name}_${pkgver//_/-}_linux_amd64.tar.gz::${url}/releases/download/v${pkgver//_/-}/${name}_${pkgver//_/-}_linux_amd64.tar.gz")
source_aarch64=("${name}_${pkgver//_/-}_linux_arm64.tar.gz::${url}/releases/download/v${pkgver//_/-}/${name}_${pkgver//_/-}_linux_arm64.tar.gz")

sha256sums_x86_64=('6b06370a7ab73f23ce53a5461de5c1ebe5e2478817a1e7d7eeef524a0e52d1de')
sha256sums_aarch64=('9af97f0e864782d474f2d48923ecfe342bb2488a10467cb67c197d0e0ae57a97')

package() {
    install -Dm755 "${srcdir}/${name}" "${pkgdir}/usr/bin/${name}"
}
