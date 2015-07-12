# Maintainer: Frederik "Freso" S. Olesen <freso.dk@gmail.com>
# Based on package by Jelle van der Waa <jelle vdwaa nl>.
pkgname=networkmanager-dispatcher-chrony
pkgver=2.1
pkgrel=1
pkgdesc="Dispatcher Script for chrony"
arch=(any)
license=('MIT')
url='https://wiki.gnome.org/Projects/NetworkManager'
depends=('networkmanager' 'chrony')
backup=(etc/NetworkManager/dispatcher.d/10-chrony)
changelog=ChangeLog
source=('10-chrony' 'LICENSE')
sha256sums=('676cc8a1b770c4e4d6985d194e3bf82d47794809d49ffa2bfbb2190f10ed7885'
            '453e6920a08aa104baf245c81568050d075379af3944ae92b03d46d01e37d6cf')

package() {
  install -Dm700 "$srcdir/10-chrony" "$pkgdir/etc/NetworkManager/dispatcher.d/10-chrony"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
