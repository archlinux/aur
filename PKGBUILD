# Maintainer: Nick G. <wirlaburla@worlio.com>

_pkgname=opendmarc
pkgname=${_pkgname}-dinit
pkgver=20250613
pkgrel=1
pkgdesc="Free open source software implementation of the DMARC specification (dinit)"
arch=('any')
source=('opendmarc.service' 'opendmarc-pre.service')
depends=('opendmarc')
sha256sums=(
	'251318f64c1413654e62171b59da3c6b9d6eeddadee0386ad1ff865498db388b'
	'b18b602a552cc1222f274b6f7feebc53a71eb0c916b3b2dda4d40129a92bb7f0')

package() {
	install -Dm644 opendmarc.service "$pkgdir/etc/dinit.d/opendmarc"
	install -Dm644 opendmarc-pre.service "$pkgdir/etc/dinit.d/opendmarc-pre"
}
