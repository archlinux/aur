# Maintainer: Kirill Pinchuk <https://github.com/cybergrind/>
pkgname=octobrowser
pkgver=1.11.6
pkgrel=1
pkgdesc='Fast anti-detect browser for multi-accounting with maximum protection against browser identification'
arch=('x86_64')
url='https://octobrowser.net'
license=('MIT License')
options=('!strip')
provides=('octobrowser')
conflicts=('octobrowser')
source=("https://octobrowser.net/releases/installer/OctoBrowser_${pkgver}.linux.tar.gz")
sha256sums=('45d3baa384d8b5dbc944e4aa832aeb5af259902c9cc49e79ec72af5259f704b7')
depends=(libxcrypt-compat
        libselinux)

package() {
  install -D "${srcdir}/OctoBrowser.AppImage" "${pkgdir}/usr/bin/octobrowser"
  chmod +x "${pkgdir}/usr/bin/octobrowser"
}
