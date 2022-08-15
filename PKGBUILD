# Maintainer: Benno Bielmeier <aur at bbenno dot com>

pkgname=csvq-bin
_pkgname=csvq
pkgver=1.17.10
pkgrel=1
pkgdesc='SQL-like query language for csv'
url='https://mithrandie.github.io/csvq/'
license=('MIT')
arch=('x86_64')
makedepends=('go')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("https://github.com/mithrandie/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-amd64.tar.gz")
sha256sums=('962501ae0a54e1e618d1317120aec369071e323d90b03086997565737a5f9dbc')

package() {
	cd "${srcdir}/${_pkgname}-v${pkgver}-linux-amd64"
	install -Dm755 './csvq' "${pkgdir}/usr/bin/csvq"
}
