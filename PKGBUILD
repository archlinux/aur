# Maintainer: Platon Ryzhikov <ihummer63@yandex.ru>

pkgname=smdev-platform
pkgver=20210602
pkgrel=1
pkgdesc="Add links to platform devices in /dev with smdev"
arch=('any')
licence=('MIT')
groups=('smdev-scripts')
depends=('smdev')
source=("20-platform")
sha256sums=('f091a8b199bd784b8c3542d30b9d3e55122f8e4d283a599be9e7d596028ef4ef')

package() {
	install -m644 -D 20-platform ${pkgdir}/etc/smdev/add/20-platform
}
