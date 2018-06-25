# Maintainer: Van-ess0 <van-ess0@mail.ru>
pkgname=dockstation
pkgver=1.4.1
pkgrel=1
pkgdesc="Working with Docker has never been so easy and convenient."
arch=('x86_64')
url="https://github.com/DockStation/dockstation"
license=('proprietary')
groups=('')
depends=('alsa-lib' 'atk' 'cairo' 'dbus' 'desktop-file-utils' 'electron' 'expat' 'fontconfig' 'freetype2' 'gcc-libs' 'gconf' 'gdk-pixbuf2' 'glib2' 'gtk2' 'hicolor-icon-theme' 'libappindicator-gtk2' 'libcups' 'libnotify' 'libx11' 'libxcb' 'libxcomposite' 'libxcursor' 'libxdamage' 'libxext' 'libxfixes' 'libxi' 'libxrandr' 'libxrender' 'libxss' 'libxtst' 'nspr' 'nss' 'pango')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/DockStation/dockstation/releases/download/v1.4.1/dockstation_1.4.1_amd64.deb")
sha512sums_x86_64=('9da786b6f330193433ff085e5e4e3ee2ce1c74b574ec97e49d46b1b97b7e634514fd51be7ac9c6e2ce73a63d7c8b95b49046f4b14f3e212f2b37ecac76e8161d')

package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	install -D -m644 "${pkgdir}/opt/DockStation/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
