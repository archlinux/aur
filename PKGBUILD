# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Amin Vakil <info AT aminvakil DOT com>

_pkgname=pumba
pkgname=pumba-bin
pkgver=1.2.1
pkgrel=1
pkgdesc="Chaos testing, network emulation and stress testing tool for containers "
arch=('aarch64' 'x86_64')
url="https://github.com/alexei-led/pumba"
license=('Apache-2.0')
provides=('pumba')
conflicts=('pumba')

source_x86_64=("${_pkgname}-${pkgver}-linux-x86_64::$url/releases/download/$pkgver/${_pkgname}_linux_amd64")
source_aarch64=("${_pkgname}-${pkgver}-linux-aarch64::$url/releases/download/$pkgver/${_pkgname}_linux_arm64")

sha256sums_aarch64=('cd777d9e2b80b90d842305580dea1def0ebfbee07775fdac21d7989493d8d71c')
sha256sums_x86_64=('f4a4b52a0940f58b5cf3d4706e4a6528a7ecbfa99ab98ffee4b348835b184e57')

package() {
    install -Dm755 "${_pkgname}-${pkgver}-linux-${CARCH}" "$pkgdir/usr/bin/${_pkgname}"
}
