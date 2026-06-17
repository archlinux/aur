# Maintainer: deadnews <deadnewsgit@gmail.com>

name="pindock"
pkgname="${name}-bin"
pkgver="1.0.1"
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

sha256sums_x86_64=('17258dcbcd889e2832f766f640c9f4c4bbe4a34f2a336fd7b522154a15ee62ac')
sha256sums_aarch64=('0f828bed45c9836e54cb7c1bbb7526ae7d574243ae8cb5212fc1d8a4d0c2cf61')

package() {
    install -Dm755 "${srcdir}/${name}" "${pkgdir}/usr/bin/${name}"
}
