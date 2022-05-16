# Maintainer: Lena Fuhrimann

pkgname=bud-bin
_pkgname="${pkgname%-bin}"
pkgver=0.1.3
pkgrel=1
pkgdesc='The Full-Stack Web Framework for Go'
arch=(x86_64)
url="https://github.com/livebud/${_pkgname}"
license=(MIT)
provides=("${_pkgname}")
source=("${url}/releases/download/v${pkgver}/${_pkgname}_linux_amd64.tar.gz")
sha256sums=('729ae1c097509eb673d3bc8c517c97b0ef3b7fc8727b5e0861d578362df0f5b5')

package() {
	install -Dm755 "bud_linux_amd64/$_pkgname" -t "${pkgdir}/usr/bin"
	install -Dm644 bud_linux_amd64/License.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
