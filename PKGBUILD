# Maintainer: Hossam Mostafa <hossamdash2@gmail.com>
pkgname=xdg-desktop-portal-gtk-dummy
pkgver=1.0
pkgrel=1
pkgdesc="Dummy backend for GTK4 to satisfy dependencies and disable portals in lightweight WSL environments"
arch=('any')
license=('MIT')
provides=('xdg-desktop-portal-gtk')
conflicts=('xdg-desktop-portal-gtk')
source=('gtk-no-portal.sh')
sha256sums=('da2cde333e4d4d5ccaa7cd92f3f787b12a14a12e5dc2e838e16f2cf900c1c87f')


package() {
  install -Dm644 "$srcdir/gtk-no-portal.sh" "$pkgdir/etc/profile.d/gtk-no-portal.sh"
}