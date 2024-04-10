# Maintainer: Nick G. <wirlaburla@worlio.com>

_pkgname=opendmarc
pkgname=${_pkgname}-dinit
pkgver=1.0.0
pkgrel=1
pkgdesc="Free open source software implementation of the DMARC specification (dinit)"
arch=('any')
source=('opendmarc.service' 'opendmarc-pre.service')
depends=('opendmarc')
sha256sums=(
	'8174e9373035d9c635b336158ec74c0abc622b5edacb52aac24222c2c5364ec2'
	'395ba1e46d30248a2ce51f997e6b8dc803d9393f55c99b9eaf997f8797e830f8')

package() {
	install -Dm644 opendmarc.service "$pkgdir/etc/dinit.d/opendmarc"
	install -Dm644 opendmarc-pre.service "$pkgdir/etc/dinit.d/opendmarc-pre"
}
