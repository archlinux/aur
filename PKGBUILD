# Maintainer: Kirill Pinchuk <https://github.com/cybergrind/>
pkgname=octobrowser
pkgver=1.8.4
pkgrel=1
pkgdesc='Fast anti-detect browser for multi-accounting with maximum protection against browser identification'
arch=('x86_64')
url='https://octobrowser.net'
license=('MIT License')
options=('!strip')
provides=('octobrowser')
conflicts=('octobrowser')
source=('https://octobrowser.net/releases/installer/OctoBrowser.linux.tar.gz')
sha256sums=('394abd298eddc191cad7b41360d3ea5ee48915877fe68a55075c735135045a7c')
depends=(libxcrypt-compat
        libselinux)

package() {
  install -D "${srcdir}/OctoBrowser.AppImage" "${pkgdir}/usr/bin/octobrowser"
  chmod +x "${pkgdir}/usr/bin/octobrowser"
}
