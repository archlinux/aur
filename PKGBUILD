# Maintainer: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
pkgname=networkmanager-dispatcher-ntpdconf
pkgver=1.0
pkgrel=1
pkgdesc="Dispatcher Script for generating ntpd.conf"
arch=(any)
license=('MIT')
url="http://www.gnome.org/projects/NetworkManager/"
depends=('networkmanager')
optdepends=('ntp' 'openntpd')
source=("10-ntpdconf" "LICENSE")
md5sums=('b1538967754a2a31e1155710bf00d8cf'
         '69120da70cc3f06557abc2d5575eee41')

package() {
	install -Dm755 $srcdir/10-ntpdconf $pkgdir/etc/NetworkManager/dispatcher.d/10-ntpdconf
	install -Dm644 $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
