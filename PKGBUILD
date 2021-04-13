# Maintainer: Evandro Begati <evandroalb at gmail dot com>
# Check for new Linux releases in: https://calimaerp.com/app

pkgname=calima-app
pkgver=2.0.7
pkgrel=1
pkgdesc="Access application for Calima ERP Contábil."
arch=('x86_64')
url="https://www.calimaerp.com"
license=('custom:calima-app')
depends=('alsa-lib' 'gtk3' 'libcups' 'libxss' 'libxtst' 'nss')
optdepends=(
	'libpipewire02: WebRTC desktop sharing under Wayland'
	'kdialog: for file dialogs in KDE'
	'gnome-keyring: for storing passwords in GNOME keyring'
	'kwallet: for storing passwords in KWallet'
	'libunity: for download progress on KDE'
	'ttf-liberation: fix fonts for some PDFs - CRBug #369991'
	'xdg-utils'
)
options=('!emptydirs' '!strip')
source=("https://objectstorage.sa-saopaulo-1.oraclecloud.com/n/id3qvymhlwic/b/downloads/o/calima-app/calima-app-${pkgver}.deb")
sha512sums=('3a71f2bf9dbca611f760f9409ee74ef7dcb3e4de83b50ed7c55bb3c1affbdcda98ec2f2c40d3dd4146a1c33f9c21edee2e54af15fd23ad0171a7b7b435afa724')

package() {
	msg2 "Extracting the data.tar.xz..."
	bsdtar -xf data.tar.xz -C ${pkgdir}
}
