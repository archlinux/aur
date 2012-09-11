# Maintainer: Frederik "Freso" S. Olesen <freso.dk@gmail.com>
# Based on package by Jelle van der Waa <jelle vdwaa nl>.
pkgname=networkmanager-dispatcher-pdnsd
pkgver=1.1
pkgrel=1
pkgdesc='Dispatcher Script for pDNSd'
arch=(any)
license=('BSD')
url='http://projects.gnome.org/NetworkManager/'
depends=('networkmanager' 'pdnsd')
backup=(etc/NetworkManager/dispatcher.d/00-pdnsd)
changelog=ChangeLog
source=('00-pdnsd')
sha256sums=('8a5e4a4299fca6bde33b7b7b2b92eb34584f0cce25a7b4825500b623d92aa2b9')

package() {
  install -Dm700 $srcdir/00-pdnsd $pkgdir/etc/NetworkManager/dispatcher.d/00-pdnsd
}
