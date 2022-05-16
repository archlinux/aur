# Maintainer: Lena Fuhrimann

pkgname=bud-bin
_pkgname="${pkgname%-bin}"
pkgver=0.1.2
pkgrel=2
pkgdesc='The Full-Stack Web Framework for Go'
arch=(x86_64)
url="https://github.com/livebud/${_pkgname}"
license=(MIT)
provides=("${_pkgname}")
source=("${url}/releases/download/v${pkgver}/${_pkgname}_linux_amd64.tar.gz")
sha256sums=('69116919b24a1ea9be9cb20f786decee11fb44940711800564ee3dd110a97fe9')

package() {
	install -Dm755 "bud_linux_amd64/$_pkgname" -t "${pkgdir}/usr/bin"
	install -Dm644 bud_linux_amd64/License.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
