# Maintainer: Platon Ryzhikov <ihummer63@yandex.ru>

pkgname=smdev-platform
pkgver=20181204
pkgrel=1
pkgdesk="Add links to platform devices in /dev with smdev"
arch=('any')
licence=('MIT')
groups=('smdev-scripts')
depends=('smdev')
source=("20-platform")
sha256sums=('4e78ef0bc3b42d276bda1ca18783e95c700fa3918e9ceb1e36fff8a8241bd4ff')

package() {
	install -m644 -D 20-platform ${pkgdir}/etc/smdev/add/20-platform
}
