# Maintainer: Carlo Sala <carlosalag@protonmail.com>

pkgname=surfshark-gui-bin
pkgver=1.1.1
pkgrel=2
pkgdesc="Surfshark VPN client. Keep your online activity and personal information secure. Put your privacy-conscious mind at rest and enjoy unrestricted internet."
arch=('x86_64')
url="https://surfshark.com"
license=('custom:surfshark')
depends=('alsa-lib' 'atk' 'at-spi2-atk' 'at-spi2-core' 'cairo' 'curl' 'dbus' 'expat' 'gdk-pixbuf2' 'gjs' 'glib2' 'gtk3' 'libcups' 'libdrm' 'libnotify' 'libsecret' 'libx11' 'libxcb' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon' 'libxrandr' 'libxtst' 'mesa' 'networkmanager' 'networkmanager-openvpn' 'nspr' 'nss' 'org.freedesktop.secrets' 'pango' 'wireguard-tools' 'zip')
optdepends=('libappindicator-gtk3')
options=('!strip' '!emptydirs')
source=("https://ocean.surfshark.com/debian/pool/main/s/surfshark/surfshark_1.1.1-969_amd64.deb")
sha512sums=('cd195b52c399430a2aafaf4cc8386fcd647d6955a9a4d4178da5d8ea27eff4166f323622c378248d6f247014e24603fd83db520e7b5bf23b570873af201ce519')
install=${pkgname}.install

package(){

	# Extract package data
	tar -xJ -f data.tar.xz -C "${pkgdir}"

	install -D -m644 "${pkgdir}/opt/Surfshark/resources/dist/resources/surfsharkd.js.LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
