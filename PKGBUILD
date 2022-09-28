# Maintainer: Carlo Sala <carlosalag@protonmail.com>

pkgname=surfshark-gui-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="Surfshark VPN client. Keep your online activity and personal information secure. Put your privacy-conscious mind at rest and enjoy unrestricted internet."
arch=('x86_64')
url="https://surfshark.com"
license=('custom:surfshark')
depends=('alsa-lib' 'at-spi2-atk' 'at-spi2-core' 'cairo' 'curl' 'dbus' 'expat' 'gjs' 'glib2' 'gtk3' 'iptables' 'libcups' 'libdrm' 'libnotify' 'libsecret' 'libx11' 'libxcb' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon' 'libxrandr' 'libxtst' 'mesa' 'networkmanager' 'networkmanager-openvpn' 'nspr' 'nss' 'org.freedesktop.secrets' 'pango' 'wireguard-tools' 'zip')
optdepends=('libappindicator-gtk3')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("https://ocean.surfshark.com/debian/pool/main/s/surfshark/surfshark_1.2.0-1109_amd64.deb")
sha512sums=('9e1daa7b26e7b4119a254f2b13256a1540b9a0e0f72b7d5c495f11b4990fe136e22ec31786ff2e875530f54ec2c40e59f50bd38eba83f5020532dddace624c21')

package(){

	# Extract package data
	tar -xJ -f data.tar.xz -C "${pkgdir}"

	install -D -m644 "${pkgdir}/opt/Surfshark/resources/dist/resources/surfsharkd.js.LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
