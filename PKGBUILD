# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Manuel Reimer <manuel.reimer@gmx.de>
pkgname=vdr-xorg
pkgver=1.0
pkgrel=1
pkgdesc="Configures VDR service to autostart an X.org server"
url="https://github.com/vdr4arch"
arch=('any')
license=('GPL3')
depends=('xlogin' 'vdr')
source=('vdr-xorg.conf')
md5sums=('0af05daea932e0af59654d98606a0550')

package() {
  install -Dm644 vdr-xorg.conf "$pkgdir/usr/lib/systemd/system/vdr.service.d/vdr-xorg.conf"
}
