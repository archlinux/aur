# Maintainer: Jelle van der Waa <jelle vdwaa nl>
pkgname=networkmanager-dispatcher-sshd
pkgver=1.0
pkgrel=5
pkgdesc="Dispatcher Script for sshd"
arch=(any)
license=('MIT')
url="http://www.gnome.org/projects/NetworkManager/"
depends=('networkmanager' 'openssh')
source=("10-sshd" "LICENSE")
md5sums=('32b05542b6dca22e2958bd9e1198b08b'
         'bade437c691452a83923e5064da20757')

package() {
    install -Dm700 $srcdir/10-sshd $pkgdir/etc/NetworkManager/dispatcher.d/10-sshd
    install -Dm644 $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
