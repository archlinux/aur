# Maintainer: Lena Fuhrimann

pkgname=bud-bin
_pkgname="${pkgname%-bin}"
pkgver=0.1.4
pkgrel=2
pkgdesc='The Full-Stack Web Framework for Go'
arch=(x86_64)
url="https://github.com/livebud/${_pkgname}"
license=(MIT)
provides=("${_pkgname}")
source=("${url}/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_linux_amd64.tar.gz")
sha256sums=('3077a19991657742c7768ed18fda521c04c83c372c8b90cf2dabab1cfaf54f64')

package() {
	install -Dm755 "${_pkgname}_v${pkgver}_linux_amd64/$_pkgname" -t "${pkgdir}/usr/bin"
	install -Dm644 "${_pkgname}_v${pkgver}_linux_amd64/License.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
