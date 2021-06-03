# Maintainer: Platon Ryzhikov <ihummer63@yandex.ru>

pkgname=smdev-uuid
pkgver=20210602
pkgrel=1
pkgdesc="Add block devices uuids with smdev"
arch=('any')
licence=('MIT')
groups=('smdev-scripts')
depends=('smdev')
source=("01-uuid")
sha256sums=('6fecb09e89bddd88126dcf5c5710904b907510e719c6084a357d99ce82456554')

package() {
	install -m644 -D 01-uuid ${pkgdir}/etc/smdev/add/01-uuid
}
