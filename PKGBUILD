# Maintainer: Platon Ryzhikov <ihummer63@yandex.ru>

pkgname=smdev-uuid
pkgver=20190205
pkgrel=1
pkgdesc="Add block devices uuids with smdev"
arch=('any')
licence=('MIT')
groups=('smdev-scripts')
depends=('smdev')
source=("01-uuid")
sha256sums=('84b9f6dcdebfbd3091b334470a628373fc193e8defd30c4222138106df7fa255')

package() {
	install -m644 -D 01-uuid ${pkgdir}/etc/smdev/add/01-uuid
}
