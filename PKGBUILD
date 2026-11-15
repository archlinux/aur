# Maintainer: deadnews <deadnewsgit@gmail.com>

name="pindock"
pkgname="${name}-bin"
pkgver="1.1.4"
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

sha256sums_x86_64=('114a91c141c96b44ddf73d32a17b20e2dc8bb809ee353f3e68ec932e2ff8bea8')
sha256sums_aarch64=('1aa00262b4814ae237b0ca784a6826d5a5a3e1895155fb0747b8249a7c8376a0')

package() {
    install -Dm755 "${srcdir}/${name}" "${pkgdir}/usr/bin/${name}"
}
