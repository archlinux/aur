# Maintainer: Caleb Bassi <calebjbassi@gmail.com>

pkgname=ytop-bin
_pkgname=${pkgname%-bin}
pkgver=0.5.1
pkgrel=1
pkgdesc="A TUI system monitor written in Rust"
arch=(x86_64)
url="https://github.com/cjbassi/ytop"
license=("MIT")
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("${_pkgname}-${pkgver}.tar.gz::${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-${arch}-unknown-linux-gnu.tar.gz")
sha256sums=("c133958e3832c98d74e4995f2017fbd560792c42a532ccbc60273cc390904077")

package() {
	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
