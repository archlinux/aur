# Maintainer: Benno Bielmeier <aur at bbenno dot com>

pkgname=csvq-bin
_pkgname=csvq
pkgver=1.18.1
pkgrel=2
pkgdesc='SQL-like query language for csv'
url='https://mithrandie.github.io/csvq/'
license=('MIT')
arch=('x86_64')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("https://github.com/mithrandie/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-amd64.tar.gz")
sha256sums=('f22a3f96cd00e9b58cd55f0515427b2058d7b13c89b62d24a4867405d4ccc588')

package() {
	cd "${srcdir}/${_pkgname}-v${pkgver}-linux-amd64"
	install -Dm755 './csvq' "${pkgdir}/usr/bin/csvq"
}
