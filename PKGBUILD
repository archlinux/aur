# Maintainer: Platon Ryzhikov <ihummer63@yandex.ru>

pkgname=smdev-libudev-zero
pkgver=20210602
pkgrel=1
pkgdesc="Trigger libudev-zero helper with smdev"
arch=('any')
licence=('MIT')
groups=('smdev-scripts')
depends=('smdev' 'libudev-zero')
source=("30-libudev")
sha256sums=('f01cb3a38b15d103cce36969f667e92136fc6ba4d962db2ab04d87f18156e6cd')

package() {
	install -m644 -D 30-libudev ${pkgdir}/etc/smdev/add/30-libudev
	install -m644 -D 30-libudev ${pkgdir}/etc/smdev/remove/30-libudev
	install -m644 -D 30-libudev ${pkgdir}/etc/smdev/bind/30-libudev
	install -m644 -D 30-libudev ${pkgdir}/etc/smdev/change/30-libudev

}
