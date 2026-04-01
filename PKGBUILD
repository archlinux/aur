# Maintainer: deadnews <deadnewsgit@gmail.com>

name="pindock"
pkgname="${name}-bin"
pkgver="1.0.0"
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

sha256sums_x86_64=('b7a8335ac3af440656bc5887aad93731d3d9f1c8fbc8aaa2fa19d855e2c07009')
sha256sums_aarch64=('ebcf1d3d4aca8f195a85eabc4142523e30c4a1bcacf79af5a0d410cf2ce3f477')

package() {
    install -Dm755 "${srcdir}/${name}" "${pkgdir}/usr/bin/${name}"
}
