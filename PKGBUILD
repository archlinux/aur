# Maintainer: Platon Ryzhikov <ihummer63@yandex.ru>

pkgname=smdev-pci
pkgver=20181225
pkgrel=1
pkgdesc="Add links to pci devices in /dev with smdev"
arch=('any')
licence=('MIT')
groups=('smdev-scripts')
depends=('smdev')
source=("20-pci")
sha256sums=('63b582c8d8d965d456829fdbe2b66bb78c03ee3a2d04ca32ed1151c2ba493447')

package() {
	install -m644 -D 20-pci ${pkgdir}/etc/smdev/add/20-pci
}
