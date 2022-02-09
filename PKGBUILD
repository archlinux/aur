# Maintainer: mynacol <dc07d át mynacol dót xyz>
# Contributor: Jelle van der Waa: <jelle vdwaa nl>
pkgname=networkmanager-dispatcher-openntpd
pkgver=1.2
pkgrel=1
pkgdesc="Dispatcher Script for openntpd"
arch=(any)
license=('MIT')
url="http://www.gnome.org/projects/NetworkManager/"
depends=('networkmanager' 'openntpd' 'sh')
source=("10-openntpd" "LICENSE")
md5sums=('88ae5da138b5273f5a24bf34c34155a1'
         'bade437c691452a83923e5064da20757')

package() {
    install -Dm744 $srcdir/10-openntpd $pkgdir/etc/NetworkManager/dispatcher.d/10-openntpd
    install -Dm644 $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
