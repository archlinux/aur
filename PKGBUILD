# Maintainer: Caleb Bassi <calebjbassi@gmail.com>

pkgname=ytop-bin
_pkgname=${pkgname%-bin}
pkgver=0.6.1
pkgrel=1
pkgdesc="A TUI system monitor written in Rust"
arch=(x86_64)
url="https://github.com/cjbassi/ytop"
license=("MIT")
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("${_pkgname}-${pkgver}.tar.gz::${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-${arch}-unknown-linux-gnu.tar.gz")
sha256sums=("9eef8c164e7af00d0d9a6aa6bc84dc43420f7717b86f6ca3c3d673cda79fbd3c")

package() {
	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
