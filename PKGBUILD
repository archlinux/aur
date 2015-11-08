# Maintainer: Moebiuseye <moebius.eye@gmail.com>
# Contributor: ??

pkgname=polar-night-theme
pkgver=20141006
pkgrel=1
pkgdesc="A Clean and compact theme for GTK3, GTK2, Metacity, xfwm4, Gnome Shell and Unity."
arch=('any')
url="http://gnome-look.org/content/show.php/Polar+Night%2Bfor+Unity?content=166607"
license=('GPL3')
depends=('gtk-engine-murrine' 'gtk-engines')
optdepends=('gnome-themes-standard: Required for the GTK3 theme')
source=($pkgname-$pkgver.tar.gz::http://gnome-look.org/CONTENT/content-files/166607-polar-night.tar.gz)
sha1sums=('0531898e24c31b1241cc41226560ba56d798b5b0')

package() {
  cd "$srcdir"
  find polar-night -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}

# vim:set ts=2 sw=2 et:
