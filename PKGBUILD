# Maintainer: Lena Fuhrimann

pkgname=bud-bin
_pkgname="${pkgname%-bin}"
pkgver=0.2.5
pkgrel=1
pkgdesc='The Full-Stack Web Framework for Go'
arch=(x86_64)
url="https://github.com/livebud/${_pkgname}"
license=(MIT)
provides=("${_pkgname}")
source=("${url}/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_linux_amd64.tar.gz")
sha256sums=('460a9cb7441ab51b2bdd7be8c0161e5b1d79728029cf7dde157257d1482820e0')

package() {
	install -Dm755 "${_pkgname}_v${pkgver}_linux_amd64/$_pkgname" -t "${pkgdir}/usr/bin"
	install -Dm644 "${_pkgname}_v${pkgver}_linux_amd64/License.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
