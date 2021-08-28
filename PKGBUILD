# Maintainer: Platon Ryzhikov <ihummer63@yandex.ru>

pkgname=smdev-libudev-zero
pkgver=20210828
pkgrel=1
pkgdesc="Trigger libudev-zero helper with smdev"
arch=('any')
licence=('MIT')
groups=('smdev-scripts')
depends=('smdev' 'libudev-zero')
source=("30-libudev")
sha256sums=('9438a1d32acf78bbbe74662c845f467f2b21978b6b6bea870b6f088082f9c8dd')

package() {
	install -m644 -D 30-libudev ${pkgdir}/etc/smdev/add/30-libudev
	install -m644 -D 30-libudev ${pkgdir}/etc/smdev/remove/30-libudev
	install -m644 -D 30-libudev ${pkgdir}/etc/smdev/bind/30-libudev
	install -m644 -D 30-libudev ${pkgdir}/etc/smdev/change/30-libudev

}
