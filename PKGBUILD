# Maintainer: Caleb Bassi <calebjbassi@gmail.com>

pkgname=ytop-bin
_pkgname=${pkgname%-bin}
pkgver=0.4.0
pkgrel=1
pkgdesc="A TUI system monitor written in Rust"
arch=(x86_64)
url="https://github.com/cjbassi/ytop"
license=("MIT")
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("${_pkgname}::${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-${arch}-unknown-linux-gnu.tar.gz")
sha256sums=("be487a6aed46f7f7c33b66f6cd3d227b0eeddab08d159c59c1676d09e7df82fc")

package() {
	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
