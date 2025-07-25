pkgname="musik"
pkgver=0.1.7
pkgrel=1
pkgdesc="A music player"
arch=('x86_64' 'aarch64')
url="https://github.com/arjav0703/music-app"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1' 'spotdl')
options=('!strip' '!debug')
install=${pkgname}.install
source_x86_64=("${url}/releases/download/app-v${pkgver}/${pkgname}_${pkgver}_amd64.deb")
sha256sums_x86_64=('ce7b3523f1a6bf7d78bb3dd0837f0d897fd18996214a2afd562cce9c50cc6715')
package() {
  tar -xvf data.tar.gz -C "${pkgdir}"
}
