# Maintainer: Nick G. <wirlaburla@worlio.com>

_pkgname=opendkim
pkgname=${_pkgname}-dinit
pkgver=1.0.0
pkgrel=2
pkgdesc="Open source implementation of the DKIM sender authentication system. Based on a fork of dkim-milter. (dinit)"
arch=('any')
source=('opendkim.service' 'opendkim-pre.service')
depends=('opendkim')
sha256sums=(
	'2cc738005f190f39c41ee9506a344cc1813dff2330dd2d91cd719a0f7f459a23'
	'ef3fa120af97991155251ea10f57eb617bd7bd9ae0f2aa82fe52c83a8ccb8b3f')

package() {
	install -Dm644 opendkim.service "$pkgdir/etc/dinit.d/opendkim"
	install -Dm644 opendkim-pre.service "$pkgdir/etc/dinit.d/opendkim-pre"
}
