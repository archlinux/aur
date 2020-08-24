# Maintainer: D S <contact@circuitrcay.com>
pkgname=webex-teams-vdi
pkgver=3.0.15711.0
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
sha512sums_x86_64=('901fcf714ba52306e9ed1c67e356f0e16d8f61dae6d4dfc7c17eb229764a5ce41f2c96e696748318d1628fac6b1572dcd84276cdbfe7d9dc575c84545730e9b0')

package(){
	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"
	install -D -m644 "/usr/share/doc/cisco-teams-vdi/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
