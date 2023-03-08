# Maintainer: Benno Bielmeier <aur at bbenno dot com>

pkgname=csvq-bin
_pkgname=csvq
pkgver=1.17.11
pkgrel=2
pkgdesc='SQL-like query language for csv'
url='https://mithrandie.github.io/csvq/'
license=('MIT')
arch=('x86_64')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("https://github.com/mithrandie/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-amd64.tar.gz")
sha256sums=('7427274b99470758f64fd42a0163c0205680f49e8fa2fd3fecb22bc63cf10a94')

package() {
	cd "${srcdir}/${_pkgname}-v${pkgver}-linux-amd64"
	install -Dm755 './csvq' "${pkgdir}/usr/bin/csvq"
}
