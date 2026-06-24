# Maintainer: libuntu <libuntu@users.noreply.github.com>
pkgname=licord-bin
_pkgname=licord
pkgver=0.1.0
pkgrel=1
pkgdesc="A fast, native, resource-efficient communication client for Arch Linux / CachyOS (Better-VC)"
arch=('x86_64')
url="https://github.com/ardahzr/Licord"
license=('MIT')
depends=(
  'cairo'
  'desktop-file-utils'
  'gdk-pixbuf2'
  'glib2'
  'gtk3'
  'hicolor-icon-theme'
  'libsoup3'
  'openssl'
  'pango'
  'webkit2gtk-4.1'
  'gst-plugins-base'
  'gst-plugins-good'
  'gst-plugins-bad'
  'gst-plugins-ugly'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip' '!debug')
source=("${url}/releases/download/v${pkgver}/Licord_${pkgver}_amd64.deb")
sha256sums=('5e26471e18b489e5246bc1520a612a85c04b77b3e17abdfe3f1b03dcf6a2c7fe')

package() {
  bsdtar -xf data.tar.gz -C "${pkgdir}"
}
