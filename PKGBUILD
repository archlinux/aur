# Maintainer: dr460nf1r3 <dr460nf1r3 at garudalinux dot org>
# Contributor: Alejandro Valdes <alejandrovaldes@live.com>

pkgname=plasma6-applets-window-title
pkgver=0.7.1
pkgrel=1
pkgdesc="Plasma 6 applet that shows the application title and icon for active window"
arch=(any)
url="https://github.com/dhruv8sh/plasma6-window-title-applet"
license=(GPL)
depends=(plasma-workspace)
source=(git+https://github.com/dhruv8sh/plasma6-window-title-applet)
sha512sums=('SKIP')

package() {
  _pkgdir="$pkgdir/usr/share/plasma/plasmoids/org.kde.windowtitle"
  mkdir -p "$_pkgdir"
  cp -r plasma6-window-title-applet/* "$_pkgdir"
  rm "$_pkgdir/README.md"
}
