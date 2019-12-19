# Maintainer: Vesim <vesim809@pm.me>
pkgname=swaymsg-root
pkgver=1
pkgrel=1
pkgdesc='small wrapper for swaymsg to allow it run as root'
arch=('any')
url='https://github.com/vesim987/swaymsg-root'
depends=('sway')
source=('swaymsg-root.sh')
sha256sums=('081e32f6a7374ef366e1f3e1314c2aca08a0e87ad3d54a655cc40880d3292c48')

package() {
  install -Dm755 swaymsg-root.sh "${pkgdir}/usr/bin/swaymsg-root"
}
