# Maintainer: Dimio <dimio at dimio dot org>

_pkgname=gost
pkgname=gost-v3-bin
pkgver=3.0.0.20240708
_ghpkgver=3.0.0-nightly.20240708
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

sha256sums_x86_64=('bd5cb10bdf6dd7b968b1defa37b5ad8db6022d97a41b88280025b3f809f679b7')
sha256sums_i686=('990a73da1e2f474579e5d5feb20842ece28a42e760a42ac8921e98c6588b199e')

package() {
	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
