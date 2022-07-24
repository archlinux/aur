# Maintainer: Benno Bielmeier <aur at bbenno dot com>

pkgname=csvq-bin
_pkgname=csvq
pkgver=1.17.8
pkgrel=1
pkgdesc='SQL-like query language for csv'
url='https://mithrandie.github.io/csvq/'
license=('MIT')
arch=('x86_64')
makedepends=('go')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("https://github.com/mithrandie/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-amd64.tar.gz")
sha256sums=('f7bbf72a192259b787e5e3b67534f74281d3a88b754628811efd21b1c82059f0')

package() {
	cd "${srcdir}/${_pkgname}-v${pkgver}-linux-amd64"
	install -Dm755 './csvq' "${pkgdir}/usr/bin/csvq"
}
