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
sha256sums_x86_64=('ab237fadcfe67eedd9c8659ee1db60eb069cf8848734646955d54c7ca355b630')
package() {
	tar -xvf data.tar.gz -C "${pkgdir}"
}
