# Maintainer: Pando85 <pando855@gmail.com>
_pkgname=rash
pkgname="${_pkgname}-bin"
pkgver=2.19.0
pkgrel=1
pkgdesc="Declarative shell scripting using Rust native bindings"
arch=('x86_64' 'aarch64')
url="https://rash-sh.github.io"
license=('GPL')
depends=('gcc-libs')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("https://github.com/rash-sh/rash/releases/download/v${pkgver}/rash-${pkgver}-${CARCH}-unknown-linux-gnu.tar.gz")
sha256sums=('1b7d53e92cff60ce4500b4dcf23c912cfd58af20e28d6b6e53e3ed7f5685006d')

package() {
	install -Dm755 ${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"
}
