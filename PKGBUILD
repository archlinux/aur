# Contributor: Dominik Schwaiger <mail@dominik-schwaiger.ch>
# Maintainer: tee < teeaur at duck dot com >
_pkgname=surrealdb
pkgname=${_pkgname}-bin
pkgver=2.3.4
pkgrel=1
pkgdesc="A scalable, distributed, collaborative, document-graph database, for the realtime web"
arch=('x86_64')
url="https://github.com/surrealdb/surrealdb"
license=('custom:BSL')
depends=('gcc-libs')
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("$url/releases/download/v${pkgver//_/-}/LICENSE")
source_x86_64=("$url/releases/download/v${pkgver//_/-}/surreal-v${pkgver//_/-}.linux-amd64.tgz")
sha256sums=('SKIP')
sha256sums_x86_64=('7253be9374ff0b6c076dedd7fac2b4d8e0f6888a6e70f94c306356e5ef4caad8')

package() {
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	install -Dm755 "${srcdir}/surreal" "${pkgdir}/usr/bin/surreal"
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
