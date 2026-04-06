# Maintainer: tygrdev <hi at tygr dot dev>
# Contributor: tygrdev <hi at tygr dot dev>
pkgname=pulsar-music-bin
pkgver=0.0.1
pkgrel=1
pkgdesc="Pulsar is a local-first, cross-platform music player. A Nord Studio project."
arch=('x86_64')
url="https://usepulsar.app"
license=('zlib')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1' 'alsa-lib' 'xdg-utils')
options=('!strip' '!debug')
install=${pkgname}.install
source_x86_64=("${url}/api/download/linux?distro=deb")
package() {
  # Extract package data
  tar -xvf data.tar.gz -C "${pkgdir}"
}
sha256sums_x86_64=('a51e2a679b4822a00db4cb58937910f9ad2ea45d025e054feb51c2ca55706879')
