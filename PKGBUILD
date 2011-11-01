# Maintainer: Frederik "Freso" S. Olesen <freso.dk@gmail.com>
# Based on package by Jelle van der Waa <jelle vdwaa nl>.
pkgname=networkmanager-dispatcher-chrony
pkgver=1.0
pkgrel=1
pkgdesc="Dispatcher Script for chrony"
arch=(any)
license=('BSD')
url="http://www.gnome.org/projects/NetworkManager"
depends=('networkmanager' 'chrony')
source=("10-chrony")
sha256sums=('2d6d9a47d19cd26255afc1d5bd8699ba8d21f4184d4ab919ae5e3d4bc9545e13')

package() {
  install -Dm700 $srcdir/10-chrony $pkgdir/etc/NetworkManager/dispatcher.d/10-chrony
}
