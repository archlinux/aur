# Maintainer: KhooLy <seslikitapicinkhooly@gmail.com>
pkgname=fluxa-desktop-bin
pkgver=0.1.30
pkgrel=1
pkgdesc="Cross-platform desktop app for streaming and managing your media library"
arch=('x86_64')
url="https://github.com/FluxaMedia/fluxa-desktop"
license=('GPL-3.0-only')
depends=('webkit2gtk-4.1' 'gtk3' 'gst-plugins-base' 'gst-plugins-good' 'libayatana-appindicator' 'librsvg')
provides=('fluxa-desktop')
conflicts=('fluxa-desktop')
source=("https://github.com/FluxaMedia/fluxa-desktop/releases/download/v${pkgver}/Fluxa.Desktop_${pkgver}_amd64.deb")
sha256sums=('af5ff69240be8ad4bacdf441a3b5464d426038607ba23322cf33ab95627acf31')

package() {
  cd "$srcdir"
  ar x "Fluxa.Desktop_${pkgver}_amd64.deb"
  tar -xf data.tar.* -C "$pkgdir"
}
