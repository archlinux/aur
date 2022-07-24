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
sha256sums=('e683accdd22617702c1fde6ace6a1524f2807785863bdcd086cf98bc252b8fbc')

package() {
	cd "${srcdir}/${_pkgname}-v${pkgver}-linux-amd64"
	install -Dm755 './csvq' "${pkgdir}/usr/bin/csvq"
}
