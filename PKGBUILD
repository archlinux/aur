pkgname=nodotify
pkgver=2.2.7
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
sha256sums=('f53a379bbe1b70025917d6a69222eccd9310a2af09dfea046a77cdc21acff6aa')

package() {
  cd "${srcdir}"
  ar x Dotify.deb
  tar -xf data.tar.* -C "${pkgdir}"
}
