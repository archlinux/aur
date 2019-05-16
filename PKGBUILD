# Maintainer: Alejandro Valdes <alejandrovaldes@live.com>

pkgname=plasma5-applets-window-title
pkgver=0.4.1
pkgrel=1
pkgdesc="Plasma 5 applet that shows the application title and icon for active window"
arch=(x86_64)
url="https://github.com/psifidotos/applet-window-title"
license=(GPL)
depends=(plasma-workspace)
source=("https://github.com/psifidotos/applet-window-title/archive/v$pkgver.tar.gz")
sha512sums=('57ba20ed4b75fc188d62063b82792595d2518f6f3de2fc5a263614044d4bbbc8be86b7ecb45ae0967ea9d3a8a61667d189b0dd89ce500d9ceb03b22b1faaa6bb')

package() {
  _pkgdir="$pkgdir/usr/share/plasma/plasmoids/org.kde.windowtitle"
  mkdir -p "$_pkgdir"
  cp -r applet-window-title-$pkgver/* "$_pkgdir"
  rm "$_pkgdir/README.md"
}
