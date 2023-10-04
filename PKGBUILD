# Maintainer: ZeroDot1 <zerodot1@bk.ru>
# Contributor: TeleGuard Team <support@teleguard.com>
pkgname=teleguard-desktop
pkgver=3.0.5
pkgrel=3
pkgdesc="Teleguard messenger client for desktops."
arch=('x86_64')
url="https://pub.teleguard.com/"
license=('')
groups=('')
depends=('desktop-file-utils' 'sqlite' 'libkeybinder3' 'libappindicator-gtk3' 'gstreamer0.10-good-plugins' 'gstreamer0.10-bad-plugins' 'libnotify' 'libpulse' 'qt5-multimedia-mdk-plugin' 'mpv' 'libplacebo' )
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://pub.teleguard.com/teleguard-desktop-latest.deb")
sha512sums_x86_64=('SKIP')

package(){

	# Extract package data
	tar -xJ -f data.tar.xz -C "${pkgdir}"

}
