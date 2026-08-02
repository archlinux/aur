# Maintainer: Runnytu < runnytu at gmail dot com >
# OldMaintainer: Alexey Kharlamov <der@2-47.ru>
# Contributor: David Dufberg Tøttrup <david at dufberg dot se>
# Contributor: Jordi De Groof <jordi(dot)degroof(at)gmail(dot)com>
# Contributor: pyther <pyther@pyther.net>
# Contributor: z3ntu <WEI16416@spengergasse.at>

pkgname=packettracer
pkgver=9.0.1
pkgrel=1
pkgdesc="A cross-platform visual simulation tool designed by Cisco Systems that allows users to create network topologies and imitate modern computer network"
arch=( 'x86_64' )
options=('!strip' '!emptydirs')
url="https://www.netacad.com/resources/lab-downloads"
license=('LicenseRef-Cisco-EULA')

source=('local://CiscoPacketTracer_901_Ubuntu_64bit.deb')
sha512sums=('c5525758fd1cbdbf59b4b8a2968073a614e4c0d89a987c6fbe8fa8568a46abbd6961f547ae682cc11248fc26af52c962aaa9c0a3a3905b7669ecfbe36a8d3e5d')

package() {

	tar xf data.tar.xz -C "${pkgdir}"
	chown -R 0:0 "${pkgdir}"
	mkdir -p "${pkgdir}/usr/lib/"
	mv "${pkgdir}/opt/pt/" "${pkgdir}/usr/lib/packettracer/"

}
