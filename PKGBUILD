pkgname=nodotify
pkgver=2.3.3
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
sha256sums=('a560f789e74bbe5b35dd4d642c39ab4a8eb8f577ffaae8c2b99f8b60f5f435fd')

package() {
  cd "${srcdir}"
  ar x Dotify.deb
  tar -xf data.tar.* -C "${pkgdir}"
}
