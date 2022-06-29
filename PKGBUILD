# Maintainer: Lena Fuhrimann

pkgname=bud-bin
_pkgname="${pkgname%-bin}"
pkgver=0.1.11
pkgrel=1
pkgdesc='The Full-Stack Web Framework for Go'
arch=(x86_64)
url="https://github.com/livebud/${_pkgname}"
license=(MIT)
provides=("${_pkgname}")
source=("${url}/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_linux_amd64.tar.gz")
sha256sums=('152956158d9a8ff6b7d1a63c24ff5a5fd962b59d2ea617de9647093b1bc76856')

package() {
	install -Dm755 "${_pkgname}_v${pkgver}_linux_amd64/$_pkgname" -t "${pkgdir}/usr/bin"
	install -Dm644 "${_pkgname}_v${pkgver}_linux_amd64/License.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
