# Maintainer: Dimio <dimio at dimio dot org>

_pkgname=gost
pkgname=gost-v3-bin
pkgver=3.2.5.20250904
_ghpkgver=3.2.5-nightly.20250904
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

sha256sums_i686=('28023a3559f86731423b11885881b48ea1dfd0dda1e37cbc15daa70b4c9914b4')
sha256sums_x86_64=('500f7ea41e8fd6f9a8ae175af9250072a89819588994b30938c63a35925f6292')

package() {
	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
