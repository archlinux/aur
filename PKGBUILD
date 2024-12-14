# Maintainer: oxydien
# Contributor: oxydien
pkgname=diggie
pkgver=0.0.2
pkgrel=1
pkgdesc="A Discord bot utility tool designed to streamline your developer experience by providing a simple, client-like application"
arch=('x86_64')
url="https://github.com/oxydien/diggie"
license=('mit')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/oxydien/diggie/releases/download/v$pkgver/diggie_"$pkgver"_amd64.deb")
package() {

  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"

}
