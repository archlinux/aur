# Maintainer: Pando85 <pando855@gmail.com>
_pkgname=rash
pkgname="${_pkgname}-bin"
pkgver=2.14.1
pkgrel=1
pkgdesc="Declarative shell scripting using Rust native bindings"
arch=('x86_64' 'aarch64')
url="https://rash-sh.github.io"
license=('GPL')
depends=('gcc-libs')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("https://github.com/rash-sh/rash/releases/download/v${pkgver}/rash-${pkgver}-${CARCH}-unknown-linux-gnu.tar.gz")
sha256sums=('2bae697be2eac2e15dc3f141afeeedfbb2b253d13200d9ac50e1c8f79c35a8d3')

package() {
	install -Dm755 ${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"
}
