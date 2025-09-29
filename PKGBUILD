pkgname=dotify
pkgver=2.0.7
pkgrel=3
pkgdesc="Next-generation music player with a modern interface and advanced features"
arch=('x86_64')
url="https://sourceforge.net/projects/dotify/"
license=('proprietary')
depends=(
  'webkit2gtk-4.1'
  'libappindicator-gtk3'
  'glib2'
  'gtk3'
  'libsoup3'
  'curl'
  'openssl'
  'cairo'
  'pango'
  'gdk-pixbuf2'
  'pkgconf'
  'libtool'
  'desktop-file-utils'
  'hicolor-icon-theme'
)

source=("dotify-${pkgver}.deb::https://sourceforge.net/projects/dotify/files/dotify/Dotify_${pkgver}_amd64.deb/download")
sha256sums=('SKIP')

package() {
  cd "${srcdir}"

  ar x "dotify-${pkgver}.deb"
  tar -xf data.tar.* -C "${pkgdir}"
}
