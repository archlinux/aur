# Maintainer: Platon Ryzhikov <ihummer63@yandex.ru>

pkgname=smdev-cdrom
pkgver=20181217
pkgrel=1
pkgdesc="cdrom processing for smdev"
arch=('any')
licence=('MIT')
groups=('smdev-scripts')
depends=('smdev')
source=("10-cdrom")
sha256sums=('87fc54002d8160c12471376083501fca14643c7de27ac659cc1b10c9e0d3c375')

package() {
	install -m644 -D 10-cdrom ${pkgdir}/etc/smdev/add/10-cdrom
}
