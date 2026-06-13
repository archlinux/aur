pkgname=nodotify
pkgver=2.3.1
pkgrel=1
pkgdesc="t.me/nodotify | music player"
arch=('x86_64')
url="https://dotify.fun"
license=('custom')
depends=(
  'webkit2gtk-4.1'
  'libayatana-appindicator'
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
provides=('dotify')
conflicts=('dotify')
source=("https://dotify.fun/Dotify.deb")
sha256sums=('5fd259c5f1951e926a4b0f09392df14deae0d5a126cba8d3826891522026c6b0')

package() {
  cd "${srcdir}"
  ar x Dotify.deb
  tar -xf data.tar.* -C "${pkgdir}"
}
