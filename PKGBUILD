# Maintainer: Caleb Bassi <calebjbassi@gmail.com>

pkgname=ytop-bin
_pkgname=${pkgname%-bin}
pkgver=0.4.2
pkgrel=1
pkgdesc="A TUI system monitor written in Rust"
arch=(x86_64)
url="https://github.com/cjbassi/ytop"
license=("MIT")
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("${_pkgname}::${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-${arch}-unknown-linux-gnu.tar.gz")
sha256sums=("316b00ae58a0ba945afd9fd3a4486361f7341bb12f90accad282c0367c6f1d2f")

package() {
	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
