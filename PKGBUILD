# MAINTAINER: Noble Eugene <nobleeugene2005@gmail.com>
pkgname="zen-browser-private-window-launcher"
pkgver=1
pkgrel=1
pkgdesc="Creates a zen browser private window desktop launcher for your desktop environment."
arch=(any)
depends=("zen-browser-bin")
url="https://github.com/eugenenoble2005/zen-browser-private-window-launcher"
source=("git+https://github.com/eugenenoble2005/zen-browser-private-window-launcher")
sha256sums=("SKIP")

package(){
  cd $srcdir/zen-browser-private-window-launcher
  install -d -m 755 "$pkgdir/usr/share/applications" && cp zen-browser-private.desktop "$pkgdir/usr/share/applications"
  echo "Copied desktop file"

  install -d -m 755 "$pkgdir/usr/share/pixmaps" && cp zen-white-private.svg "$pkgdir/usr/share/pixmaps"
  echo "Copied icon file"


}
