# Maintainer: Nick G. <wirlaburla@worlio.com>

_pkgname=opendkim
pkgname=${_pkgname}-dinit
pkgver=20250613
pkgrel=1
pkgdesc="Open source implementation of the DKIM sender authentication system. Based on a fork of dkim-milter. (dinit)"
arch=('any')
source=('opendkim.service' 'opendkim-pre.service')
depends=('opendkim')
sha256sums=(
	'ce6238cfd0f4d8009cec7fb2d0356d7b4aeb272ea440233fd1d512e0f13d6ec2'
	'e43dd8ebde151c9419383f4ee24ce7b6195c0d7687dfd40a27a0137ff0d56cd4')

package() {
	install -Dm644 opendkim.service "$pkgdir/etc/dinit.d/opendkim"
	install -Dm644 opendkim-pre.service "$pkgdir/etc/dinit.d/opendkim-pre"
}
