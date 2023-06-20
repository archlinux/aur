# Maintainer: Kirill Pinchuk <https://github.com/cybergrind/>
pkgname=octobrowser
pkgver=1.9.0
pkgrel=1
pkgdesc='Fast anti-detect browser for multi-accounting with maximum protection against browser identification'
arch=('x86_64')
url='https://octobrowser.net'
license=('MIT License')
options=('!strip')
provides=('octobrowser')
conflicts=('octobrowser')
source=('https://octobrowser.net/releases/installer/OctoBrowser.linux.tar.gz')
sha256sums=('090f5cc41af07ccd3603539120f9d0d19d70e92321e6be58293afafd25c81f5a')
depends=(libxcrypt-compat
        libselinux)

package() {
  install -D "${srcdir}/OctoBrowser.AppImage" "${pkgdir}/usr/bin/octobrowser"
  chmod +x "${pkgdir}/usr/bin/octobrowser"
}
