# Maintainer: Pando85 <pando855@gmail.com>
_pkgname=rash
pkgname="${_pkgname}-bin"
pkgver=2.21.0
pkgrel=1
pkgdesc="Declarative shell scripting using Rust native bindings"
arch=('x86_64' 'aarch64')
url="https://rash-sh.github.io"
license=('GPL')
depends=('gcc-libs')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("https://github.com/rash-sh/rash/releases/download/v${pkgver}/rash-${pkgver}-${CARCH}-unknown-linux-gnu.tar.gz")
sha256sums=('7b666694e76c636cd45aa6962efb0be86f1e5b3bab81bcc5c332b26613fd5ac4')

package() {
	install -Dm755 ${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"
}
