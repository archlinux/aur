# Maintainer: Pando85 <pando855@gmail.com>
_pkgname=rash
pkgname="${_pkgname}-bin"
pkgver=2.18.1
pkgrel=1
pkgdesc="Declarative shell scripting using Rust native bindings"
arch=('x86_64' 'aarch64')
url="https://rash-sh.github.io"
license=('GPL')
depends=('gcc-libs')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("https://github.com/rash-sh/rash/releases/download/v${pkgver}/rash-${pkgver}-${CARCH}-unknown-linux-gnu.tar.gz")
sha256sums=('586eb085e205b1af68c454a9da06aefbb78fe84234059f80056571ae3101acbd')

package() {
	install -Dm755 ${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"
}
