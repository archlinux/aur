pkgname=tunedesk
pkgver=1.0.0
pkgrel=1
pkgdesc="Desktop client for IPTV"
arch=('x86_64')
url="https://github.com/NotNoss/Tunedesk"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("${url}/releases/download/1.0.0/tunedesk_1.0.0_amd64.deb")
sha256sums_x86_64=('533d3e64f4fd0425d9579862ea1815486f92d85345884de8ec54413a756bb8bb')
package() {
	tar -xvf data.tar.gz -C "${pkgdir}"
}
