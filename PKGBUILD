# Maintainer: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
pkgname=networkmanager-dispatcher-ypconf
pkgver=1.0
pkgrel=1
pkgdesc="Dispatcher Script for generating yp.conf"
arch=(any)
license=('MIT')
url="http://www.gnome.org/projects/NetworkManager/"
depends=('networkmanager' 'ypbind-mt')
source=("10-ypconf" "LICENSE")
md5sums=('5f1c1e694d157801b5119d5b6cf44283'
         '69120da70cc3f06557abc2d5575eee41')

package() {
	install -Dm755 $srcdir/10-ypconf $pkgdir/etc/NetworkManager/dispatcher.d/10-ypconf
	install -Dm644 $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
