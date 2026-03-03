pkgname=nodotify
pkgver=2.2.0
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
sha256sums=('b6c1e803dec070bcebab6d02b62f0480e1ae8fda5397a04ea68611a88b02427d')

package() {
  cd "${srcdir}"
  ar x Dotify.deb
  tar -xf data.tar.* -C "${pkgdir}"
}
