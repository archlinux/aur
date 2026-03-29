# Maintainer: deadnews <deadnewsgit@gmail.com>

_pkgname="pindock"
pkgname="${_pkgname}-bin"
pkgver="1.0.0_alpha.6"
pkgrel=1
pkgdesc="Pin and update Docker image digests in Dockerfiles and compose files"
arch=("x86_64" "aarch64")
url="https://github.com/deadnews/pindock"
license=("MIT")
provides=("pindock")
conflicts=("pindock")
options=("!strip")

source_x86_64=("${_pkgname}_${pkgver//_/-}_linux_amd64.tar.gz::${url}/releases/download/v${pkgver//_/-}/${_pkgname}_${pkgver//_/-}_linux_amd64.tar.gz")
source_aarch64=("${_pkgname}_${pkgver//_/-}_linux_arm64.tar.gz::${url}/releases/download/v${pkgver//_/-}/${_pkgname}_${pkgver//_/-}_linux_arm64.tar.gz")

sha256sums_x86_64=('12b3dcce92682478763d34368cf0b2b4962efc1ebdef25e77b301a1f7696ddd0')
sha256sums_aarch64=('7ead875a0e6cda898e8cfe56b90b3ff42312e731e85d4e45ee481a7d7567072f')

package() {
    install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
