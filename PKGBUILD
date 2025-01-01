pkgname=readest
pkgver=0.8.8
pkgrel=1
pkgdesc="Readest is a modern, feature-rich ebook reader designed for avid readers offering seamless cross-platform access, powerful tools, and an intuitive interface to elevate your reading experience." 
arch=('x86_64' 'aarch64')
url="https://github.com/readest/readest"
license=('AGPL-3.0-or-later')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/readest/readest/releases/download/v$pkgver/Readest_"$pkgver"_amd64.deb")
sha256sums_x86_64=('SKIP')
package() {

  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"

}
