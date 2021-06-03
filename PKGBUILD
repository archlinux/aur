# Maintainer: Platon Ryzhikov <ihummer63@yandex.ru>

pkgname=smdev-pci
pkgver=20210602
pkgrel=1
pkgdesc="Add links to pci devices in /dev with smdev"
arch=('any')
licence=('MIT')
groups=('smdev-scripts')
depends=('smdev')
source=("20-pci")
sha256sums=('c0f9097c83cfe2d93764a66d4c3d028a0dbd624ffc79b263ccec828724021302')

package() {
	install -m644 -D 20-pci ${pkgdir}/etc/smdev/add/20-pci
}
