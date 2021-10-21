# Maintainer: Aditya Mehra <aix (dot) m (at) outlook (dot) com>

_pkgname=bigscreen-image-settings
pkgname=bigscreen-image-settings-git
pkgver=r01.8977fdbf
pkgrel=1
pkgdesc="Plasma Bigscreen configurations for Bigscreen Images"
arch=("x86_64" "i686" "armv7h" "aarch64")
url="https://invent.kde.org/plasma-bigscreen/bigscreen-image-settings"
license=('GPL')
makedepends=('git' 'cmake' 'extra-cmake-modules')
provides=("bigscreen-image-settings")
conflicts=("bigscreen-image-settings")
install=$pkgname.install
source=('git+https://invent.kde.org/plasma-bigscreen/bigscreen-image-settings')
sha512sums=('SKIP')

package() {
  install -Dm644 $srcdir/$_pkgname/etc/xdg/applications-blacklistrc $pkgdir/etc/xdg/applications-blacklistrc
  install -Dm644 $srcdir/$_pkgname/etc/xdg/bigscreen $pkgdir/etc/xdg/bigscreen
  install -Dm644 $srcdir/$_pkgname/etc/xdg/kcmfonts $pkgdir/etc/xdg/kcmfonts
  install -Dm644 $srcdir/$_pkgname/etc/xdg/kdeglobals $pkgdir/etc/xdg/kdeglobals
  install -Dm644 $srcdir/$_pkgname/etc/xdg/kscreenlockerrc $pkgdir/etc/xdg/kscreenlockerrc
  install -Dm644 $srcdir/$_pkgname/etc/xdg/kscreensaverrc $pkgdir/etc/xdg/kscreensaverrc
  install -Dm644 $srcdir/$_pkgname/etc/xdg/ksmserverrc $pkgdir/etc/xdg/ksmserverrc
  install -Dm644 $srcdir/$_pkgname/etc/xdg/kwinrc $pkgdir/etc/xdg/kwinrc
  install -Dm644 $srcdir/$_pkgname/etc/xdg/plasma-nm $pkgdir/etc/xdg/plasma-nm
  install -Dm644 $srcdir/$_pkgname/etc/xdg/plasmarc $pkgdir/etc/xdg/plasmarc
  install -Dm644 $srcdir/$_pkgname/etc/xdg/plasmashellrc $pkgdir/etc/xdg/plasmashellrc
  install -Dm644 $srcdir/$_pkgname/etc/modules-load.d/uinput.conf $pkgdir/etc/modules-load.d/uinput.conf
  install -Dm644 $srcdir/$_pkgname/etc/udev/rules.d/40-uinput.rules $pkgdir/etc/udev/rules.d/40-uinput.rules
  install -Dm644 $srcdir/$_pkgname/etc/sddm.conf.d/autologin.conf $pkgdir/etc/sddm.conf.d/autologin.conf
  install -Dm774 $srcdir/$_pkgname/etc/profile.d/enforce-platform.sh $pkgdir/etc/profile.d/enforce-platform.sh
  install -Dm774 $srcdir/$_pkgname/etc/profile.d/enforce-qtvirtualkeyboard.sh $pkgdir/etc/profile.d/enforce-qtvirtualkeyboard.sh
  install -Dm774 $srcdir/$_pkgname/etc/profile.d/mediacenterfileselector.sh $pkgdir/etc/profile.d/mediacenterfileselector.sh
  install -Dm774 $srcdir/$_pkgname/usr/bin/cec-daemon.py $pkgdir/usr/bin/cec-daemon.py
  install -Dm774 $srcdir/$_pkgname/usr/bin/autoResolution.py $pkgdir/usr/bin/autoResolution.py
  install -Dm644 $srcdir/$_pkgname/usr/lib/systemd/user/cec-daemon.service $pkgdir/usr/lib/systemd/user/cec-daemon.service
  install -Dm644 $srcdir/$_pkgname/usr/lib/systemd/user/auto-resolution.service $pkgdir/usr/lib/systemd/user/auto-resolution.service
}
