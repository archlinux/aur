pkgname=dotify
pkgver=2.1.3
pkgrel=4
pkgdesc="Next-generation music player with a modern interface and advanced features"
arch=('x86_64')
url="https://sourceforge.net/projects/dotify/files/dotify/Dotify_2.1.3_amd64.deb/download"
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

source=("https://sourceforge.net/projects/dotify/files/dotify/Dotify_2.1.3_amd64.deb/download")
sha256sums=('SKIP')

package() {
  cd "${srcdir}"

  # Распаковка .deb
  ar x download

  # Извлечение содержимого пакета
  tar -xf data.tar.* -C "${pkgdir}"
}
