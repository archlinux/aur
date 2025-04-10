# Maintainer: Kirill Pinchuk <https://github.com/cybergrind/>
pkgname=octobrowser
pkgver=2.5.6
pkgrel=1
pkgdesc='Fast anti-detect browser for multi-accounting with maximum protection against browser identification'
arch=('x86_64')
url='https://octobrowser.net'
license=('MIT License')
options=('!strip')
provides=('octobrowser')
conflicts=('octobrowser')
source=("https://binaries.octobrowser.net/releases/installer/OctoBrowser_${pkgver}.linux.tar.gz")
sha256sums=('0696c656c9184831805ec5033641d24262a0ebd9061901ebb525f7d07323670b')
depends=(libxcrypt-compat
         libselinux
         unzip
         xdg-desktop-portal-gtk)

package() {
  install -D "${srcdir}/OctoBrowser.AppImage" "${pkgdir}/usr/bin/octobrowser"
  chmod +x "${pkgdir}/usr/bin/octobrowser"
}
