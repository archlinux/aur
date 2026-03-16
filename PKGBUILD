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
sha256sums=('10c446a0756c5a4aa60a8941a1549b7cdd57a1f078095c80ba0812cf1471fb26')

package() {
  cd "${srcdir}"
  ar x Dotify.deb
  tar -xf data.tar.* -C "${pkgdir}"
}
