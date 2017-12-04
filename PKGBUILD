# Maintainer: kiralex <kiralex1995 at gmail dot com>
# Contributor: kiralex <kiralex1995 at gmail dot com>
pkgname=whatever
pkgver=1.0.0
pkgrel=1
pkgdesc="An unofficial Evernote client for Linux desktop"
arch=('i686' 'x86_64')
url="https://github.com/CellarD0-0r/whatever#readme"
license=('MIT')
groups=('')
depends=('alsa-lib' 'atk' 'cairo' 'dbus' 'desktop-file-utils' 'electron' 'expat' 'fontconfig' 'freetype2' 'gcc-libs' 'gconf' 'gdk-pixbuf2' 'glib2' 'gtk2' 'hicolor-icon-theme' 'libappindicator-gtk2' 'libcups' 'libnotify' 'libx11' 'libxcomposite' 'libxcursor' 'libxdamage' 'libxext' 'libxfixes' 'libxi' 'libxrandr' 'libxrender' 'libxss' 'libxtst' 'nspr' 'nss' 'pango')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_i686=("https://github.com/CellarD0-0r/whatever/releases/download/v1.0.0/Whatever_1.0.0_i386.deb")
source_x86_64=("https://github.com/CellarD0-0r/whatever/releases/download/v1.0.0/Whatever_1.0.0_amd64.deb")
sha512sums_i686=('39663de9cbd3103c94991d4ffc802fcea15e67d52a925f235b18ce56aff00f436483d3255fe14310a8eebcdae3898c6d51f23e67d0749ade5a808e284cb132a7')
sha512sums_x86_64=('426db18e2758a66d43db1b4796de8ca7a3bbbf4f674b6ddbdd089ad6ed1d2ec1689d519c82dab2d183c2ff336c9f0a6e26b97ddbd39fd4cc9259f5af0305cf12')

package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	install -D -m644 "${pkgdir}/opt/Whatever/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
