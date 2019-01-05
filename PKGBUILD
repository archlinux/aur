# Maintainer: Platon Ryzhikov <ihummer63@yandex.ru>

pkgname=smdev-uuid
pkgver=20190105
pkgrel=1
pkgdesc="Add block devices uuids with smdev"
arch=('any')
licence=('MIT')
groups=('smdev-scripts')
depends=('smdev')
source=("01-uuid")
sha256sums=('d98735779002a318752d0cc8925ed744e1aefe49107575ad0edecea18f002739')

package() {
	install -m644 -D 01-uuid ${pkgdir}/etc/smdev/add/01-uuid
}
