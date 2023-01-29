# Maintainer: Lena Fuhrimann

pkgname=bud-bin
_pkgname="${pkgname%-bin}"
pkgver=0.2.8
pkgrel=2
pkgdesc='The Full-Stack Web Framework for Go'
arch=(x86_64)
url="https://github.com/livebud/${_pkgname}"
license=(MIT)
provides=("${_pkgname}")
source=("${url}/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_linux_amd64.tar.gz")
sha256sums=('ba0a0b80a22fd724c03a8cc007b384317038b08488fcbac564ba4f1e9e8b0f74')

package() {
	install -Dm755 "${_pkgname}_v${pkgver}_linux_amd64/$_pkgname" -t "${pkgdir}/usr/bin"
	install -Dm644 "${_pkgname}_v${pkgver}_linux_amd64/License.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
