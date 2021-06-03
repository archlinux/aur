# Maintainer: Platon Ryzhikov <ihummer63@yandex.ru>

pkgname=smdev-cdrom
pkgver=20210602
pkgrel=1
pkgdesc="cdrom processing for smdev"
arch=('any')
licence=('MIT')
groups=('smdev-scripts')
depends=('smdev')
source=("10-cdrom")
sha256sums=('7184d9d6e0aaec566cb071d4d6105b57afd1236e273ce19b39f2a4c56f00b099')

package() {
	install -m644 -D 10-cdrom ${pkgdir}/etc/smdev/add/10-cdrom
}
