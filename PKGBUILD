# Maintainer: krazykirby99999 krazykirby99999-at-gmail-dot-com
# Contributor: ajbura, hbarsaiyan
pkgname=cinny-desktop-bin
pkgver=1.1.2
pkgrel=1
pkgdesc="Unofficial Build of the Cinny Desktop Client. Repackages hbarsaiyan/cinny-tauri .deb package to an Arch-Compatible format."
arch=('x86_64')
url="https://cinny.in/"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'openssl' 'pango' 'webkit2gtk' 'libappindicator-gtk3')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/KrazyKirby99999/cinny-desktop-bin-deb/releases/download/1.1.1/cinny_1.1.1_amd64.deb")
sha512sums_x86_64=('ee10f3135f574faacfd34ffe3e01d5cef271298f0f8fac9442ac05d68b63c7f46c9c49e3f109ab69afea55c205b422426a99f6df077f934f3bf52acc4475b0a7')

package(){

	# Extract package data
	tar xzf data.tar.gz -C "${pkgdir}"

}
