pkgname=mdns-browser
pkgver=0.8.12
pkgrel=1
pkgdesc="A cross platform mDNS-Browser app written in Rust using tauri and leptos "
arch=('x86_64')
url="https://github.com/hrzlgnm/mdns-browser"
license=('mit')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/hrzlgnm/mdns-browser/releases/download/mdns-browser-v$pkgver/mdns-browser_"$pkgver"_amd64.deb")
sha256sums_x86_64=('6a2a7c2bfd678ed6dc4345d2e17e52aac43f7591c5984c1f634a187a1f3b820a')
package() {
	tar -xz -f data.tar.gz -C "${pkgdir}"
}

