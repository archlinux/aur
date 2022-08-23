# Maintainer: Carlo Sala <carlosalag@protonmail.com>

pkgname=surfshark-gui-bin
pkgver=1.1.0
pkgrel=2
pkgdesc="Surfshark VPN client. Keep your online activity and personal information secure. Put your privacy-conscious mind at rest and enjoy unrestricted internet."
arch=('x86_64')
url="https://surfshark.com"
license=('custom:surfshark')
depends=('alsa-lib' 'atk' 'at-spi2-atk' 'at-spi2-core' 'cairo' 'curl' 'dbus' 'expat' 'gdk-pixbuf2' 'gjs' 'glib2' 'gtk3' 'libcups' 'libdrm' 'libnotify' 'libsecret' 'libx11' 'libxcb' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon' 'libxrandr' 'libxtst' 'mesa' 'networkmanager>=1.20.0' 'networkmanager-openvpn' 'nspr' 'nss' 'org.freedesktop.secrets' 'pango' 'wireguard-dkms' 'wireguard-tools' 'zip')
optdepends=('libappindicator-gtk3')
options=('!strip' '!emptydirs')
source=("https://ocean.surfshark.com/debian/pool/main/s/surfshark/surfshark_1.1.0-959_amd64.deb")
sha512sums=('a6bbbbcaeca3ddc5ffe95a4274ad9bfcc98662cc7824f1c5a331de1a64e4284fe1c34997ac66bd00ab56e4cf790c1fa2b392457b1e71077e78cf9fe069a2f7a1')
install=${pkgname}.install

package(){

	# Extract package data
	tar -xJ -f data.tar.xz -C "${pkgdir}"

	install -D -m644 "${pkgdir}/opt/Surfshark/resources/dist/resources/surfsharkd.js.LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
