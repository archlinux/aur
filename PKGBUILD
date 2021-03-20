# Maintainer: Rihards Skuja <rhssk@posteo.eu>

pkgname=netinstall-dev
pkgver=7.1beta5
pkgrel=1
pkgdesc="Install and reinstall MikroTik devices running RouterOS (dev channel)"
arch=('i686' 'x86_64')
url="https://www.mikrotik.com/download"
license=('custom')
provides=('netinstall')
conflicts=('netinstall')
source=("https://download.mikrotik.com/routeros/$pkgver/netinstall-$pkgver.tar.gz")
sha256sums=('fed66ce7cdf0c23caacade790314f37079c77549e681fb11892f25294bbd4458')

package() {
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
	install -Dm755 netinstall "$pkgdir/usr/bin/netinstall"
}
