# Maintainer: D S <contact@circuitrcay.com>
pkgname=webex-teams-vdi
pkgver=3.0.16605.0
pkgrel=1
pkgdesc="Webex Teams VDI is a lightweight client for virtual desktops."
arch=('x86_64')
url="http://www.cisco.com"
license=('custom')
groups=('')
depends=('alsa-lib' 'cuda' 'dbus' 'expat' 'fontconfig' 'freetype2' 'gcc-libs' 'glib2' 'glibc' 'libgcrypt' 'libglvnd' 'libjpeg6-turbo' 'libpulse' 'libx11' 'libxcb' 'libxext' 'libxfixes' 'libxi' 'libxrandr' 'libxrender' 'libxss' 'openssl-1.0' 'qt5-base' 'systemd-libs' 'zlib')
backup=('etc/build.teamsvdi.cisco' 'etc/init/teamsvdi.conf' 'etc/systemd/system/teamsvdi.service' 'etc/teams/build.cisco' 'etc/udev/rules.d/81-plugin-hidraw.rules')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://binaries.webex.com/vdi-linux-aws-gold/cisco_teams_vdi.x86_64.deb")
sha512sums_x86_64=('08e3216512500e1bdeac7c620a2aa8bd3bdbd2fc1040be9355070cde20e73e5e29e9f2fc88b1a8d2c523f5e0b642eee3417f4acba82332b90998ffefda85ed2c')

package(){
	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"
	install -D -m644 "${pkgdir}/usr/share/doc/cisco-teams-vdi/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
