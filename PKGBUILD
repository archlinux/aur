# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Amin Vakil <info AT aminvakil DOT com>

_pkgname=pumba
pkgname=pumba-bin
pkgver=1.1.7
pkgrel=1
pkgdesc="Chaos testing, network emulation and stress testing tool for containers "
arch=('aarch64' 'x86_64')
url="https://github.com/alexei-led/pumba"
license=('Apache-2.0')
provides=('pumba')
conflicts=('pumba')

source_x86_64=("${_pkgname}-${pkgver}-linux-x86_64::$url/releases/download/$pkgver/${_pkgname}_linux_amd64")
source_aarch64=("${_pkgname}-${pkgver}-linux-aarch64::$url/releases/download/$pkgver/${_pkgname}_linux_arm64")

sha256sums_aarch64=('31534f3b6cccca947f5a51430ea5ee40527a3840e969058e48963e05577c833a')
sha256sums_x86_64=('39484583037e667c0b9757d9b02ce1ccc01a8ed0c50e1832e1ece255d8e91e3e')

package() {
    install -Dm755 "${_pkgname}-${pkgver}-linux-${CARCH}" "$pkgdir/usr/bin/${_pkgname}"
}
