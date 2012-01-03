# Maintainer: Frederik "Freso" S. Olesen <freso.dk@gmail.com>
# Based on package by Jelle van der Waa <jelle vdwaa nl>.
pkgname=networkmanager-dispatcher-pdnsd
pkgver=1.0
pkgrel=1
pkgdesc="Dispatcher Script for pDNSd"
arch=(any)
license=('BSD')
url="http://projects.gnome.org/NetworkManager/"
depends=('networkmanager' 'pdnsd')
backup=(etc/NetworkManager/dispatcher.d/00-pdnsd)
changelog=ChangeLog
source=("00-pdnsd")
sha256sums=('b158e54d240a5f553a22b503a392bb59bc061f871d55c5625b0483dc7ad1302c')

package() {
  install -Dm700 $srcdir/00-pdnsd $pkgdir/etc/NetworkManager/dispatcher.d/00-pdnsd
}
