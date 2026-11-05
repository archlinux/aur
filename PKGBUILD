# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Amin Vakil <info AT aminvakil DOT com>

_pkgname=pumba
pkgname=pumba-bin
pkgver=1.6.0
pkgrel=1
pkgdesc="Chaos testing, network emulation and stress testing tool for containers "
arch=('aarch64' 'x86_64')
url="https://github.com/alexei-led/pumba"
license=('Apache-2.0')
provides=('pumba')
conflicts=('pumba')

source_x86_64=("${_pkgname}-${pkgver}-linux-x86_64::$url/releases/download/$pkgver/${_pkgname}_linux_amd64")
source_aarch64=("${_pkgname}-${pkgver}-linux-aarch64::$url/releases/download/$pkgver/${_pkgname}_linux_arm64")

sha256sums_aarch64=('21520a3b1f2e27a246df694d1ad98d628f06714282cae86c9236f67a9f4a566e')
sha256sums_x86_64=('bec37de7db16569a8e837466b190c40f4f14f12b2388a5b1f6ded9c2d2df38fa')

package() {
    install -Dm755 "${_pkgname}-${pkgver}-linux-${CARCH}" "$pkgdir/usr/bin/${_pkgname}"
}
