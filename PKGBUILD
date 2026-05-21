pkgname=tunedesk
pkgver=1.0.1
pkgrel=1
pkgdesc="Desktop client for IPTV"
arch=('x86_64')
url="https://github.com/NotNoss/Tunedesk"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("${url}/releases/download/1.0.1/tunedesk_1.0.1_amd64.deb")
sha256sums_x86_64=('c6410679a84af3111499ec244007117c4b99cee0383507c198a7ceebf44b14d5')
package() {
	tar -xvf data.tar.gz -C "${pkgdir}"
}
