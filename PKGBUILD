# Maintainer: Nick G. <wirlaburla@worlio.com>

pkgname=biboumi-dinit
_pkgname=biboumi
pkgver=1.0.0
pkgrel=1
pkgdesc="XMPP gateway to IRC (dinit)"
arch=('any')
source=('biboumi.service')
depends=('biboumi')
sha256sums=('0a87e36eb5fbaead3cc7eacf5c367e6e42c1d1f8d15e5ee821bd68e733533db3')

package() {
	install -Dm644 biboumi.service "$pkgdir/etc/dinit.d/biboumi"
}
