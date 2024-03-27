# Maintainer: James McMurray <jamesmcm03@gmail.com>

_pkgname="flytectl"
pkgname=flytectl-bin
pkgver=0.8.14
pkgrel=1
pkgdesc='Flyte official command-line interface'
arch=('x86_64' 'aarch64')
url='https://github.com/flyteorg/flytectl'
license=('Apache')
source_x86_64=("${_pkgname}-${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_x86_64.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_arm64.tar.gz")
noextract=("${_pkgname}")
sha256sums_x86_64=('bba5c08806a9044b75b0ddcb1132ecb773a579d8ebbf4dce34d924b60a5987e2')
sha256sums_aarch64=('026cfe6230c416d110d61871fb9db5e40ce53673017489f9818233c3173245d8')
provides=('flytectl')
conflicts=('flytectl')

package() {
  install -Dm755 ${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"
}
