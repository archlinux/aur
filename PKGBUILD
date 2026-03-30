# Maintainer: Kirill Pinchuk <https://github.com/cybergrind/>
pkgname=octobrowser
pkgver=2.10.9
pkgrel=1
pkgdesc='Fast anti-detect browser for multi-accounting with maximum protection against browser identification'
arch=('x86_64')
url='https://octobrowser.net'
license=('MIT License')
options=('!strip')
provides=('octobrowser')
conflicts=('octobrowser')
source=("https://binaries.octobrowser.net/releases/installer/OctoBrowser_${pkgver}.linux.tar.gz")
sha256sums=('335cd87a98c394ecdb7446054b4f7d44457febc930f30d635ecfd1f218f5e720')
depends=(libxcrypt-compat
         libselinux
         unzip
         xdg-desktop-portal-gtk)

package() {
  install -D "${srcdir}/OctoBrowser.AppImage" "${pkgdir}/usr/bin/octobrowser"
  chmod +x "${pkgdir}/usr/bin/octobrowser"
}
