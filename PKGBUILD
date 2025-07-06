# Maintainer: Dimio <dimio at dimio dot org>

_pkgname=gost
pkgname=gost-v3-bin
pkgver=3.1.0.20250702
_ghpkgver=3.1.0-nightly.20250702
pkgrel=1
pkgdesc="GO Simple Tunnel - A simple security tunnel"
arch=('x86_64' 'i386')
url="https://gost.run/en/"
_ghurl="https://github.com/go-gost/gost"
license=('MIT')
provides=("${pkgname}=${pkgver}")
conflicts=("${_pkgname}")

source_x86_64=("${_ghurl}/releases/download/v${_ghpkgver}/${_pkgname}_${_ghpkgver}_linux_amd64.tar.gz")
source_i386=("${_ghurl}/releases/download/v${_ghpkgver}/${_pkgname}_${_ghpkgver}_linux_386.tar.gz")

sha256sums_i686=('347db39dd070776594150802d1291fdfd871a3411471ae8c8adc61718e45afa9')
sha256sums_x86_64=('647145f9da35eff560a93384b0b7b6f9b9d81cf68fd65a1b700a3ec951fb3282')

package() {
	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
