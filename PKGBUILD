# Maintainer: Runnytu < runnytu at gmail dot com >
# OldMaintainer: Alexey Kharlamov <der@2-47.ru>
# Contributor: David Dufberg Tøttrup <david at dufberg dot se>
# Contributor: Jordi De Groof <jordi(dot)degroof(at)gmail(dot)com>
# Contributor: pyther <pyther@pyther.net>
# Contributor: z3ntu <WEI16416@spengergasse.at>

pkgname=packettracer
pkgver=9.0.0
pkgrel=1
pkgdesc="A cross-platform visual simulation tool designed by Cisco Systems that allows users to create network topologies and imitate modern computer network"
arch=( 'x86_64' )
options=('!strip' '!emptydirs')
url="https://www.netacad.com/resources/lab-downloads"
license=('LicenseRef-Cisco-EULA')

source=('local://CiscoPacketTracer_900_Ubuntu_64bit.deb')
sha512sums=('5a92952435fd4829eb9f84602e21328dcd47b9dc59265d7f84a4162d85f270c9628c800197464a07f79bdf9fe6b728721d91d87fe3255a07e19d7fe4d2069865')

package() {

	tar xf data.tar.xz -C "${pkgdir}"
	chown -R 0:0 "${pkgdir}"
	mkdir -p "${pkgdir}/usr/lib/"
	mv "${pkgdir}/opt/pt/" "${pkgdir}/usr/lib/packettracer/"

}
