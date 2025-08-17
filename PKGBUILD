# Maintainer: Dimio <dimio at dimio dot org>

_pkgname=gost
pkgname=gost-v3-bin
pkgver=3.2.5.20250813
_ghpkgver=3.2.5-nightly.20250813
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

sha256sums_i686=('187c9aad494049ba3b7b04ab81c2b42e51cea5d1df98b437d851b0ef6a3661b5')
sha256sums_x86_64=('d12bac7a885b4c47808a593c7c70d773aa8cf0742a752f0f6ea471d56f452ffd')

package() {
	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
