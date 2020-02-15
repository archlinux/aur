# Maintainer: Caleb Bassi <calebjbassi@gmail.com>

pkgname=ytop-bin
_pkgname=${pkgname%-bin}
pkgver=0.4.3
pkgrel=2
pkgdesc="A TUI system monitor written in Rust"
arch=(x86_64)
url="https://github.com/cjbassi/ytop"
license=("MIT")
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("${_pkgname}-${pkgver}::${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-${arch}-unknown-linux-gnu.tar.gz")
sha256sums=("c0398ede74b700bcdd763f85d534b1d41840095f11b361b7de5b3006d0553c5f")

package() {
	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
