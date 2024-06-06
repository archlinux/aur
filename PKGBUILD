# Maintainer: Luis Pérez <luis.perez@protonmail.com>
pkgname=pumble-desktop-bin
pkgver=1.3.28
pkgrel=0
pkgdesc='Pumble is a free team alternative to Slack and Microsoft Teams. Unlimited users and history - all for free.'
arch=('x86_64')
url="https://pumble.com"
license=('CUSTOM')
groups=('Internet')
depends=('alsa-lib' 'atk' 'at-spi2-atk' 'at-spi2-core' 'cairo' 'dbus' 'desktop-file-utils' 'expat' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libappindicator-gtk3' 'libcups' 'libdrm' 'libnotify' 'libsecret' 'libx11' 'libxcb' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon' 'libxrandr' 'libxshmfence' 'libxss' 'libxtst' 'mesa' 'nspr' 'nss' 'pango' 'util-linux-libs' 'xdg-utils')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("https://pumble.com/download/desktop/linux/Pumble-linux-${pkgver}.deb")
sha256sums=('b2d30b6c048b32699f37d5f4a615cb5276ead251e66fb5df20a23069305248ba')

package(){
	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	install -D -m644 "${pkgdir}/opt/Pumble/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -D -m644 "${pkgdir}/opt/Pumble/LICENSE.electron.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron"

}
