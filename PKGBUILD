# Maintainer: Alejandro Valdes <alejandrovaldes@live.com>

pkgname=plasma5-applets-window-title
pkgver=0.5.0
pkgrel=1
pkgdesc="Plasma 5 applet that shows the application title and icon for active window"
arch=(x86_64)
url="https://github.com/psifidotos/applet-window-title"
license=(GPL)
depends=(plasma-workspace)
source=("https://github.com/psifidotos/applet-window-title/archive/v$pkgver.tar.gz")
sha512sums=('d7e5860c67d0556f0427702b9b11f1203a251534907a9af93d28152c36ba690a4d56c406f7809fed00c8bcb635d71d3c46d1666d42b4764f6ab226113c3a881f')

package() {
  _pkgdir="$pkgdir/usr/share/plasma/plasmoids/org.kde.windowtitle"
  mkdir -p "$_pkgdir"
  cp -r applet-window-title-$pkgver/* "$_pkgdir"
  rm "$_pkgdir/README.md"
}
