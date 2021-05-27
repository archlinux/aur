# Maintainer: Rihards Skuja <rhssk@posteo.eu>

pkgname=netinstall-dev
pkgver=7.1beta6
pkgrel=1
pkgdesc="Install and reinstall MikroTik devices running RouterOS (dev channel)"
arch=('i686' 'x86_64')
url="https://www.mikrotik.com/download"
license=('custom')
provides=('netinstall')
conflicts=('netinstall')
source=("https://download.mikrotik.com/routeros/$pkgver/netinstall-$pkgver.tar.gz")
sha256sums=('7c2cfc825a90263969e337f6e3f522ed5aa175853f5d49c4d10a31912e27beea')

package() {
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
	install -Dm755 netinstall "$pkgdir/usr/bin/netinstall"
}
