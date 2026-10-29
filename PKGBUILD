# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Amin Vakil <info AT aminvakil DOT com>

_pkgname=pumba
pkgname=pumba-bin
pkgver=1.4.0
pkgrel=1
pkgdesc="Chaos testing, network emulation and stress testing tool for containers "
arch=('aarch64' 'x86_64')
url="https://github.com/alexei-led/pumba"
license=('Apache-2.0')
provides=('pumba')
conflicts=('pumba')

source_x86_64=("${_pkgname}-${pkgver}-linux-x86_64::$url/releases/download/$pkgver/${_pkgname}_linux_amd64")
source_aarch64=("${_pkgname}-${pkgver}-linux-aarch64::$url/releases/download/$pkgver/${_pkgname}_linux_arm64")

sha256sums_aarch64=('e84d305324708298d7ab332a766077d376ceca241716f052863fc91f1c3f1a5c')
sha256sums_x86_64=('b8e2be1e662df27e8d1384a7fdf9b3486be0ee4fc9b6f03153679434178514a9')

package() {
    install -Dm755 "${_pkgname}-${pkgver}-linux-${CARCH}" "$pkgdir/usr/bin/${_pkgname}"
}
