# Maintainer: Anatoly Rugalev <anatoly.rugalev gmail com>

pkgname=libinput-xrandr-autorotate
pkgver=0.1.0
pkgrel=5
pkgdesc="Allows to rotate screen and touch input for 2-in-1 laptops"
url="https://github.com/AnatolyRugalev/libinput-xrandr-autorotate"
license=('GPLv3')
arch=('x86_64')
depends=()

source=("https://github.com/AnatolyRugalev/libinput-xrandr-autorotate/releases/download/${pkgver}/libinput-xrandr-autorotate_${pkgver}_Linux_amd64.tar.gz")
sha256sums=('71b706cb0da76ae22100fa23919aaf7e09e896457e2434bd811f6face3a58ed3')
package() {
  cd "$srcdir"
  install -d "$pkgdir/usr/bin"
  install -m755 libinput-xrandr-autorotate "$pkgdir/usr/bin/libinput-xrandr-autorotate"
  install -DT -m0755 "$srcdir/libinput-xrandr-autorotate.service" "$pkgdir/usr/lib/systemd/system/libinput-xrandr-autorotate.service"
}
