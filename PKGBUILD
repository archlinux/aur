# Maintainer: dr460nf1r3 <dr460nf1r3 at garudalinux dot org>
# Contributor: Alejandro Valdes <alejandrovaldes@live.com>

pkgname=plasma6-applets-window-title
pkgver=0.3
pkgrel=1
pkgdesc="Plasma 6 applet that shows the application title and icon for active window"
arch=(any)
url="https://github.com/dhruv8sh/plasma6-window-title-applet"
license=(GPL)
depends=(plasma-workspace)
source=(https://github.com/dhruv8sh/plasma6-window-title-applet/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('a37e131ac103665df9268251d73a9c4db02e6a44d68bcdb9b1d66394fd328a08')

package() {
  _pkgdir="$pkgdir/usr/share/plasma/plasmoids/org.kde.windowtitle"
  mkdir -p "$_pkgdir"
  cp -r plasma6-window-title-applet-$pkgver/* "$_pkgdir"
  rm "$_pkgdir/README.md"
}
