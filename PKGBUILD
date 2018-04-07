# Maintainer: Giga300 <giga300@protonmail.com>
# Contributor: Giga300 <giga300@protonmail.com>

pkgname=luna
pkgver=2.0.0
_pkgver=v200
pkgrel=1
pkgdesc="npm management through a modern UI. Created with ReactJS and Redux, Material-UI. Bundled with Webpack. Build on Electron."
arch=('x86_64')
url="https://github.com/rvpanoz/luna"
license=('GPL-3.0')
groups=('')
depends=('alsa-lib' 'atk' 'cairo' 'dbus' 'electron' 'expat' 'fontconfig' 'freetype2' 'gconf' 'gdk-pixbuf2' 'glib2' 'gtk2' 'libcups' 'libnotify' 'libsecret' 'libx11' 'libxcb' 'libxcomposite' 'libxcursor' 'libxdamage' 'libxext' 'libxfixes' 'libxi' 'libxrandr' 'libxrender' 'libxss' 'libxtst' 'nspr' 'nss' 'pango')
options=('!strip' '!emptydirs')

source_x86_64=("http://104.236.58.95/luna/releases/${_pkgver}/luna_${pkgver}_amd64.deb")
sha512sums_x86_64=('81810b89ea0ff55a88888e8c04cfddb4977a30e9d73a1ef90f57bb5c85c4603ffc0412d544eb7ed627ecf0ca28fea45e477c712c2145d16b8d7d21b12b93716b')

package() {
	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	# Symlink
	install -d "${pkgdir}/usr/bin"
	ln -s "/opt/Luna/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
