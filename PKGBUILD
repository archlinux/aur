# Maintainer: Lorenzo Nizzi <lorenzo.nizzi.grifi@gmail.com>
pkgname=gosign
pkgver=2.0.9
pkgrel=1
pkgdesc="Nuovo tool di firma e rinnovo online per i certificati digitali emessi da InfoCert"
arch=('x86_64')
url="https://www.firma.infocert.it"
license=('CUSTOM')
# groups=('')
depends=('alsa-lib' 'atk' 'at-spi2-atk' 'at-spi2-core' 'bzip2' 'cairo' 'curl' 'dbus' 'desktop-file-utils' 'expat' 'freetype2' 'gcc-libs' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'hicolor-icon-theme' 'hidapi' 'libcups' 'libnotify' 'libusb' 'libx11' 'libxcb' 'libxcomposite' 'libxcursor' 'libxdamage' 'libxext' 'libxfixes' 'libxi' 'libxml2' 'libxrandr' 'libxrender' 'libxslt' 'libxss' 'libxtst' 'nspr' 'nss' 'openssl' 'pango' 'pcsclite' 'trash-cli' 'xdg-utils' 'zlib')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("https://rinnovofirma.infocert.it/gosign/download/linux/latest/GoSign-Desktop-installer-linux.deb")
sha512sums=('593b1b8d4a8a47de87dbdfa991d93f35d5aad6371a06ba79e46a650f5856347f04379b8a9d0e2b172d6ad80bfed26c0c90a04d8486c60945262fa45abb169ed1')

package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	install -dm 755 "$pkgdir/usr"/{lib,bin,share}
	install -dm 755 "$pkgdir/usr/share/applications"
	install -dm 755 "$pkgdir/usr/share/pixmaps"
	install -dm 755 "$pkgdir/usr/share/doc"
	install -dm 755 "$pkgdir/usr"
#	install -D -m644 "/usr/lib/gosigndesktop/resources/app/node_modules/yargs-parser/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
#	install -D -m644 "/usr/share/doc/gosigndesktop/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"

}
