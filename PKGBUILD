# Maintainer: Thanos Apostolou <thanosapostolou@outlook.com>

pkgname=tuxguitar-gtk3-launcher
pkgver=1
pkgrel=1
pkgdesc="Launcher for tuxguitar with SWT_GTK3=1"
arch=('x86_64')
url="http://sourceforge.net/projects/tuxguitar"
license=('LGPL')
depends=('tuxguitar' 'gtk3')
source=(tuxguitar-gtk3
        tuxguitar-gtk3.desktop
        tuxguitar-gtk3.sh)
sha256sums=('2cce573750a09a0eee3a2885bf3fe7312f3145dc2d804ba51dd7dc7510dccb49'
            '0e7cd3b51db25295a937d7c988143e3968d76c82646da1f73f540b327663bf34'
            '1e4579f69d337b087bfde4d55331253a8a101df4c8171ee894626e1a814b03e8')

package() {
  install -Dm 755 tuxguitar-gtk3 "${pkgdir}/usr/bin/tuxguitar-gtk3"
  install -Dm 644 tuxguitar-gtk3.desktop "${pkgdir}/usr/share/applications/tuxguitar-gtk3.desktop"
  install -Dm 755 tuxguitar-gtk3.sh "${pkgdir}/usr/share/tuxguitar/tuxguitar-gtk3.sh"
}
