# Maintainer: James McMurray <jamesmcm03@gmail.com>

_pkgname="flytectl"
pkgname=flytectl-bin
pkgver=0.8.18
pkgrel=1
pkgdesc='Flyte official command-line interface'
arch=('x86_64' 'aarch64')
url='https://github.com/flyteorg/flytectl'
license=('Apache')
source_x86_64=("${_pkgname}-${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_x86_64.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_arm64.tar.gz")
noextract=("${_pkgname}")
sha256sums_x86_64=('431828790af05f227b3970ec1315873582daa56b217cdfb88c7079b4ba1838d9')
sha256sums_aarch64=('dcc837661faed6932e77ffb160f06e439f95cf910ba6c6da27f702c18193b363')
provides=('flytectl')
conflicts=('flytectl')

package() {
  install -Dm755 ${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"
}
