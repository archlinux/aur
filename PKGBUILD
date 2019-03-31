# Maintainer: Alejandro Valdes <alejandrovaldes@live.com>

pkgname=plasma5-applets-window-title
pkgver=0.4
pkgrel=1
pkgdesc="Plasma 5 applet that shows the application title and icon for active window"
arch=(x86_64)
url="https://github.com/psifidotos/applet-window-title"
license=(GPL)
depends=(plasma-workspace)
source=("https://github.com/psifidotos/applet-window-title/archive/v$pkgver.tar.gz")
sha512sums=('75b0f113dc6448bab64cf37b624b0299fbc79659cbfcf94e68f28a5deeda94c5dd3ad57fea1eb05489731a9aade5d2c876cc30f5b29336df41117d7c1c73b30f')

package() {
  _pkgdir="$pkgdir/usr/share/plasma/plasmoids/org.kde.windowtitle"
  mkdir -p "$_pkgdir"
  cp -r applet-window-title-$pkgver/* "$_pkgdir"
  rm "$_pkgdir/README.md"
}
