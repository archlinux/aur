# Maintainer: James McMurray <jamesmcm03@gmail.com>

_pkgname="flytectl"
pkgname=flytectl-bin
pkgver=0.8.0
pkgrel=1
pkgdesc='Flyte official command-line interface'
arch=('x86_64' 'aarch64')
url='https://github.com/flyteorg/flytectl'
license=('Apache')
source_x86_64=("${_pkgname}-${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_x86_64.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_arm64.tar.gz")
noextract=("${_pkgname}")
sha256sums_x86_64=('c6bc441761dee165e6de01247f9a27b6d6c86f49ec47489dfb6ca1d01eb717d8')
sha256sums_aarch64=('5ec0c32781f6a7fbf54904d147318aafc6f6c24a2a521133e563dbf2241cac2a')
provides=('flytectl')
conflicts=('flytectl')

package() {
  install -Dm755 ${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"
}
