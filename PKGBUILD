# Maintainer: Van-ess0 <van-ess0@mail.ru>
pkgname=dockstation
pkgver=1.3.0
pkgrel=1
pkgdesc="Working with Docker has never been so easy and convenient."
arch=('x86_64')
url="https://github.com/DockStation/dockstation"
license=('proprietary')
groups=('')
depends=('alsa-lib' 'atk' 'cairo' 'dbus' 'desktop-file-utils' 'electron' 'expat' 'fontconfig' 'freetype2' 'gcc-libs' 'gconf' 'gdk-pixbuf2' 'glib2' 'gtk2' 'hicolor-icon-theme' 'libappindicator-gtk2' 'libcups' 'libnotify' 'libx11' 'libxcb' 'libxcomposite' 'libxcursor' 'libxdamage' 'libxext' 'libxfixes' 'libxi' 'libxrandr' 'libxrender' 'libxss' 'libxtst' 'nspr' 'nss' 'pango')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/DockStation/dockstation/releases/download/v1.3.0/dockstation_1.3.0_amd64.deb")
sha512sums_x86_64=('182db4742b8d9147f2a812dcacd6f4a1bf9fed5430a3cf607f4900d0b757df8ac044e1a8e775aa22fdb9332c776d6308a9966feb837882ec6cec689c8ffd8def')

package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	install -D -m644 "${pkgdir}/opt/DockStation/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
