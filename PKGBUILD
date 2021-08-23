# Maintainer: Rihards Skuja <rhssk@posteo.eu>

pkgname=netinstall-dev
pkgver=7.1rc1
pkgrel=1
pkgdesc="Install and reinstall MikroTik devices running RouterOS (dev channel)"
arch=('i686' 'x86_64')
url="https://www.mikrotik.com/download"
license=('custom')
provides=('netinstall')
conflicts=('netinstall')
source=("https://download.mikrotik.com/routeros/$pkgver/netinstall-$pkgver.tar.gz")
sha256sums=('0a36c8551224363cf97c24c4d09f4a195c9ee0faca5f2565ee8c27ba35e3ef87')

package() {
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
	install -Dm755 netinstall "$pkgdir/usr/bin/netinstall"
}
