# Maintainer: Platon Ryzhikov <ihummer63@yandex.ru>

pkgname=smdev-lvm2
pkgver=20181225
pkgrel=1
pkgdesc="LVM processing for smdev"
arch=('any')
licence=('MIT')
groups=('smdev-scripts')
depends=('smdev' 'lvm2')
source=("01-lvm")
sha256sums=('1bda9cab63426456dd46b9946ea66735bba0a3c0d6ebff326c17874c2d7fdfa5')

package() {
	install -m644 -D 01-lvm ${pkgdir}/etc/smdev/add/01-lvm
}
