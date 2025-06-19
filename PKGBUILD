# Maintainer: Pando85 <pando855@gmail.com>
_pkgname=rash
pkgname="${_pkgname}-bin"
pkgver=2.15.0
pkgrel=1
pkgdesc="Declarative shell scripting using Rust native bindings"
arch=('x86_64' 'aarch64')
url="https://rash-sh.github.io"
license=('GPL')
depends=('gcc-libs')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("https://github.com/rash-sh/rash/releases/download/v${pkgver}/rash-${pkgver}-${CARCH}-unknown-linux-gnu.tar.gz")
sha256sums=('9dcfa05e748c97afeae4ea76f4c46f82987517f14c0f52eb4f82c38b7d171e90')

package() {
	install -Dm755 ${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"
}
