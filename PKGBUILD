# Maintainer: Aditya Mehra <aix (dot) m (at) outlook (dot) com>

_pkgname=pico-wizard-bigscreen-configs-git
pkgname=pico-wizard-bigscreen-configs
pkgver=r01.8977fdbf
pkgrel=1
pkgdesc="Pico Wizard configurations for Bigscreen Images"
arch=("x86_64" "i686" "armv7h" "aarch64")
url="https://invent.kde.org/adityam/pico-wizard-bigscreen-configs"
license=('GPL')
makedepends=('git' 'cmake' 'extra-cmake-modules')
provides=("pico-wizard-bigscreen-configs")
conflicts=("pico-wizard-bigscreen-configs")
source=('git+https://invent.kde.org/adityam/pico-wizard-bigscreen-configs')
sha512sums=('SKIP')

package() {
  install -Dm644 $srcdir/$_pkgname/etc/sddm.conf.d/90-pico-wizard-autologin.conf $pkgdir/etc/sddm.conf.d/90-pico-wizard-autologin.conf
  install -Dm755 $srcdir/$_pkgname/usr/share/xsessions/pico-wizard-x11-session.desktop $pkgdir/usr/share/xsessions/pico-wizard-x11-session.desktop
  install -Dm755 $srcdir/$_pkgname/usr/bin/pico-wizard-wrapper-x11 $pkgdir/usr/bin/pico-wizard-wrapper-x11
  install -Dm755 $srcdir/$_pkgname/usr/bin/pico-wizard-x11-session $pkgdir/usr/bin/pico-wizard-x11-session
}
