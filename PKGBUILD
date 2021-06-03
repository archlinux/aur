# Maintainer: Platon Ryzhikov <ihummer63@yandex.ru>

pkgname=smdev-lvm2
pkgver=20210602
pkgrel=1
pkgdesc="LVM processing for smdev"
arch=('any')
licence=('MIT')
groups=('smdev-scripts')
depends=('smdev' 'lvm2')
source=("01-lvm")
sha256sums=('3ab58b6069416d0701a989f38eed2f5adfa1c82d9238f19ce125bdc9c4a95b0e')

package() {
	install -m644 -D 01-lvm ${pkgdir}/etc/smdev/add/01-lvm
}
