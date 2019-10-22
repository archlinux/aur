# Maintainer: Van-ess0 <van-ess0@mail.ru>
pkgname=dockstation
pkgver=1.5.1
pkgrel=1
pkgdesc="Working with Docker has never been so easy and convenient."
arch=('x86_64')
url="https://github.com/DockStation/dockstation"
license=('proprietary')
groups=('')
depends=('alsa-lib' 'atk' 'cairo' 'dbus' 'desktop-file-utils' 'electron' 'expat' 'fontconfig' 'freetype2' 'gcc-libs' 'gconf' 'gdk-pixbuf2' 'glib2' 'gtk2' 'hicolor-icon-theme' 'libappindicator-gtk2' 'libcups' 'libnotify' 'libx11' 'libxcb' 'libxcomposite' 'libxcursor' 'libxdamage' 'libxext' 'libxfixes' 'libxi' 'libxrandr' 'libxrender' 'libxss' 'libxtst' 'nspr' 'nss' 'pango')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/DockStation/dockstation/releases/download/v${pkgver}/dockstation_${pkgver}_amd64.deb")
sha512sums_x86_64=('37f24d5a34007c8b5b762a55e98bb2ccf8ce690ec96abc3de0e54ca002df3ef86a515f10205025d149fee457e36a99b9994030bcb16d38036d7f448ca6921d39')

package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	install -D -m644 "${pkgdir}/opt/DockStation/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
