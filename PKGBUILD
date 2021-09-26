# Maintainer: Laurent OF Fough
pkgname=iptvnator-bin
_pkgname=iptvnator
pkgver=0.8.0
pkgrel=1
pkgdesc="Cross-platform IPTV player app, supports m3u+m3u8 playlists, favorites, TV guide, TV archive/catchup and more."
arch=('x86_64')
url="https://github.com/4gray/iptvnator"
license=('MIT')
depends=('alsa-lib' 'at-spi2-atk' 'at-spi2-core' 'atk' 'cairo' 'dbus' 'desktop-file-utils' 'expat' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libappindicator-gtk3' 'libcups' 'libdrm' 'libnotify' 'libsecret' 'libx11' 'libxcb' 'libxcomposite' 'libxcursor' 'libxdamage' 'libxext' 'libxfixes' 'libxi' 'libxrandr' 'libxrender' 'libxss' 'libxtst' 'mesa' 'nspr' 'nss' 'pango' 'util-linux-libs' 'xdg-utils')
options=('!strip' '!emptydirs')
install=${_pkgname}.install
source=("https://github.com/4gray/iptvnator/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('52c910dba4f57e507c2d6074b1d13e01b34379b0454a29213ad34ade44edf3cc')

package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	install -D -m644 "${pkgdir}/opt/${_pkgname}/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSES.${_pkgname}.chromium.html"
	install -D -m644 "${pkgdir}/opt/${_pkgname}/LICENSE.electron.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.${_pkgname}.electron.txt"

}
