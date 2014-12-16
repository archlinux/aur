# Maintainer: Frederik "Freso" S. Olesen <freso.dk@gmail.com>
# Based on package by Jelle van der Waa <jelle vdwaa nl>.
pkgname=networkmanager-dispatcher-chrony
pkgver=1.1
pkgrel=1
pkgdesc="Dispatcher Script for chrony"
arch=(any)
license=('BSD')
url='https://wiki.gnome.org/Projects/NetworkManager'
depends=('networkmanager' 'chrony')
backup=(etc/NetworkManager/dispatcher.d/10-chrony)
changelog=ChangeLog
source=('10-chrony')
sha256sums=('676cc8a1b770c4e4d6985d194e3bf82d47794809d49ffa2bfbb2190f10ed7885')

package() {
  install -Dm700 "$srcdir/10-chrony" "$pkgdir/etc/NetworkManager/dispatcher.d/10-chrony"
}
