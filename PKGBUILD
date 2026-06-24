# Maintainer: libuntu <libuntu@users.noreply.github.com>
pkgname=licord-bin
_pkgname=licord
pkgver=0.1.0
pkgrel=2
pkgdesc="Hosted Discord-inspired native chat for Arch Linux / CachyOS"
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
source=("${url}/releases/download/v${pkgver}/Licord_${pkgver}-${pkgrel}_amd64.deb")
sha256sums=('7d1826d97397d629919b8aded2940f3d8d4cab9d4ebf243289c3a1ac2e18d486')

package() {
  bsdtar -xf data.tar.gz -C "${pkgdir}"
}
