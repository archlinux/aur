#Maintainer : Robin -ChinaskiJr- Colombier <robin dot colombier at gmail dot com>
#The program is a fork from a script wrote by Kory Becker <http://www.primaryobjects.com/kory-becker/>
pkgname=vpndemon-cli
pkgver=1.0
pkgrel=1
pkgdesc="Monitor a VPN connection on Linux and kill a process upon disconnect, command line interface (CLI) version"
arch=('any')
url='https://github.com/chinaskijr/vpndemon'
license=('MIT')
depends=('networkmanager' 'dbus' 'openvpn' 'networkmanager-openvpn')
makedepends=('bash')
source=("https://github.com/ChinaskiJr/${pkgname}/archive/master.zip")
sha256sums=('8f0ad658af8311dc01af6fb2b727459496c8c5ecd3d9b11d62935e40c918619d')
sha512sums=('224a5064ea804272d7cc09bc698089a8768cf98b7f9039e7e7e4b0c8a965f2aab605fd3d65266dff404523fdd4264926095565a3fa7808491a7482764de137b3')

package() {
	mkdir -p "${pkgdir}/usr/bin"
	install -D -m644 "${srcdir}/vpndemon-cli-master/vpndemon-cli.sh" "${pkgdir}/usr/bin"
	mv ${pkgdir}/usr/bin/vpndemon-cli.sh ${pkgdir}/usr/bin/vpndemon-cli
	chmod +x ${pkgdir}/usr/bin/vpndemon-cli
}