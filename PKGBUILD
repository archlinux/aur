# Maintainer: Alejandro Valdes <alejandrovaldes@live.com>

pkgname=plasma5-applets-window-title
pkgver=0.1
pkgrel=1
pkgdesc="Plasma 5 applet that shows the application title and icon for active window"
arch=(x86_64)
url="https://github.com/psifidotos/applet-window-title"
license=(GPL)
depends=(plasma-workspace)
source=("https://github.com/psifidotos/applet-window-title/archive/v$pkgver.tar.gz")
sha512sums=('f478eeac90801c35d4a8b0717603d8e60943d1841f567835a2cbc83c7246af30681cec90b4538671ee86fc986af093db3c4297f6fa663020a63cd4d9ba1857f8')

package() {
  _pkgdir="$pkgdir/usr/share/plasma/plasmoids/org.kde.windowtitle"
  mkdir -p "$_pkgdir"
  cp -r applet-window-title-$pkgver/* "$_pkgdir"
  rm "$_pkgdir/README.md"
}
