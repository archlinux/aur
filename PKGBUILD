pkgname=infinitywallet
pkgver=1.0.67beta
pkgrel=4
pkgdesc="Digital asset wallet"
arch=('x86_64')
url="https://infinitywallet.io"
license=('')
depends=('alsa-lib' 'atk' 'at-spi2-atk' 'at-spi2-core' 'cairo' 'dbus' 'desktop-file-utils' 'discord' 'expat' 'fontconfig' 'freetype2' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libappindicator-gtk3' 'libcups' 'libnotify' 'libsecret' 'libx11' 'libxcb' 'libxcomposite' 'libxcursor' 'libxdamage' 'libxext' 'libxfixes' 'libxi' 'libxrandr' 'libxrender' 'libxss' 'libxtst' 'nspr' 'nss' 'pango' 'util-linux-libs' 'xdg-utils' 'zlib')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/InfinityWallet/Releases/releases/download/v1.0.67-beta/InfinityWallet_1.0.67-beta_amd64.deb")
sha512sums_x86_64=('49a67187138c64924af26adf6e36e862550c314c94d5564b0086be0b13255326e7ef2ec8242c8d1f47b58b9e8bdb7c620b57f42ad3bf226405603ed5be6c2357')

package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	install -D -m644 "${pkgdir}/opt/InfinityWallet/resources/app.asar.unpacked/node_modules/phantomjs-prebuilt/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
