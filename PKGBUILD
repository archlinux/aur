# Maintainer: krazykirby99999 krazykirby99999-at-gmail-dot-com
# Contributor: ajbura, hbarsaiyan
pkgname=cinny-desktop-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="Unofficial Build of the Cinny Desktop Client. Repackages hbarsaiyan/cinny-tauri .deb package to an Arch-Compatible format."
arch=('x86_64')
url="https://cinny.in/"
license=('MIT')
groups=('')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'openssl' 'pango' 'webkit2gtk')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/hbarsaiyan/cinny-tauri/releases/download/v1.1.0/cinny_1.1.0_amd64.deb")
sha512sums_x86_64=('7311ae424f6f30687863cb34479643eddde9128f6f760bb223fccabe54eaae4341d0d97a7069902d0a7c8022c2021e9563be1c074b2e6ac5523b7ced9619b9c4')

package(){

	# Extract package data
	tar xzf data.tar.gz -C "${pkgdir}"

}
