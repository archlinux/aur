# Maintainer: Kirill Pinchuk <https://github.com/cybergrind/>
pkgname=octobrowser
pkgver=1.10.5
pkgrel=1
pkgdesc='Fast anti-detect browser for multi-accounting with maximum protection against browser identification'
arch=('x86_64')
url='https://octobrowser.net'
license=('MIT License')
options=('!strip')
provides=('octobrowser')
conflicts=('octobrowser')
source=("https://octobrowser.net/releases/installer/OctoBrowser_${pkgver}.linux.tar.gz")
sha256sums=('0b0a70794aa7587a9e2f18c27ef0821ec280d40983bd2632181b2a1da43268c4')
depends=(libxcrypt-compat
        libselinux)

package() {
  install -D "${srcdir}/OctoBrowser.AppImage" "${pkgdir}/usr/bin/octobrowser"
  chmod +x "${pkgdir}/usr/bin/octobrowser"
}
