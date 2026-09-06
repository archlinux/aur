# Maintainer: Vincent Dahmen <wahrwolf@archlinux.org>
pkgname=calibre-plugin-crosspoint
pkgver=0.2.7
pkgrel=1
pkgdesc="Calibre Plugin to Sync CrossPoint Devices with Library- Calibre Plugin"
arch=('any')
url="https://github.com/crosspoint-reader/calibre-plugins/"
license=('MIT')
depends=('calibre>=2.0.0')
source=("https://github.com/crosspoint-reader/calibre-plugins/releases/download/v${pkgver}/crosspoint_reader-v${pkgver}.zip")
noextract=("crosspoint-${pkgver}.zip")
sha256sums=('466a2b5fc6496faec40c498c625105971038066a01271fa3e7a3ad5befa2adf2')
package() {
	install -m644 -D "${srcdir}/crosspoint-${pkgver}.zip" "${pkgdir}/usr/share/calibre/system-plugins/crosspoint-${pkgver}.zip"
}

