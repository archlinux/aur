# Maintainer: Timothy Gelter <timothy dot gelter plus aur at gmail dot com>
pkgname=cryptr-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="A GUI for Vault"
arch=('x86_64')
url="https://github.com/adobe/cryptr#readme"
license=('Apache')
groups=('')
depends=('alsa-lib' 'atk' 'at-spi2-atk' 'cairo' 'dbus' 'desktop-file-utils' 'discord' 'expat' 'gconf' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'hicolor-icon-theme' 'libappindicator-gtk2' 'libcups' 'libglvnd' 'libnotify' 'libutil-linux' 'libx11' 'libxcb' 'libxcomposite' 'libxcursor' 'libxdamage' 'libxext' 'libxfixes' 'libxi' 'libxrandr' 'libxrender' 'libxss' 'libxtst' 'nspr' 'nss' 'pango')
options=('!strip' '!emptydirs')
install=cryptr.install
source=("https://github.com/adobe/cryptr/releases/download/0.4.0/cryptr_0.4.0_amd64.deb")
md5sums=('194d791e890856869bb38c147ce34566')
package(){
	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"
	install -D -m644 "/opt/Cryptr/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
