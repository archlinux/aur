# Maintainer: deadnews <deadnewsgit@gmail.com>

name="pindock"
pkgname="${name}-bin"
pkgver="1.0.0_alpha.9"
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

sha256sums_x86_64=('52bdd3c0143cb46f923f4ff0861d0f56e52f5cd216b3e7cf5d305cc014bac333')
sha256sums_aarch64=('5a95c9cae2c39a8e806105eaa48f737666910c529a0d3271fa4ce2f76dad3a94')

package() {
    install -Dm755 "${srcdir}/${name}" "${pkgdir}/usr/bin/${name}"
}
