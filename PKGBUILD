# Maintainer sakura1943 <1436700265@qq.com>

pkgname='windterm-bin'
pkgver='2.1.0'
pkgrel=1
pkgdesc='A Quicker and better SSH/Telnet/Serial/Shell/Sftp client for DevOps.'
arch=('x86_64')
depends=()
license=('Apache-2.0')
url='https://github.com/kingToolbox/WindTerm/'
provides=('windterm')
source=("${pkgname}-${pkgver}-${arch}.tar.gz::https://github.com/kingToolbox/WindTerm/releases/download/2.1/WindTerm_2.1.0_Linux_Portable.tar.gz"
	"windterm.png::https://github.com/kingToolbox/WindTerm/raw/master/images/WindTerm_icon_1024x1024.png"
	"windterm"
	"windterm.desktop")
sha512sums=('a948712add39ac5e2d4193a4049058e3d09587313ced0e0ca219da4f2b2128e517c14d071c3c617f5e4a51db4fff2cb866ec91451f25ffe64f4053fba71958cb'
	"bfdcb9064eca32b06e6c493a48e8b38240cf9133a2d14a8ab45a4c0280bcfbef45f671dc1b86b64d7e6429cfaa6a95a9db7bb8c9c605b3b9aa852998a5abc17e"
	"f825d8ceaf4fe847c8ff94e11e58946147ab3a7eef94b72d90e29c02429047b9f87ad3ca1e23dc2d36fcf1f43667bfcf7ecabd029257a4a5c85bbdc1715169b5"
	"ff9246d8075e65e9efce9e5c2f6e1d5ed9b03d848951b0d8cc5555c475f7af406c4ef51d2ee514399e28218850a866740eb79b411acccfa621d9df7efa0f9c0a")

package (){
	mkdir --parent "${pkgdir}"/opt
	mkdir --parent "${pkgdir}"/usr/share/icons
	mkdir --parent "${pkgdir}"/usr/share/applications
	mkdir --parent "${pkgdir}"/usr/bin
	mv "${srcdir}"/* "${pkgdir}"/opt
	mv "${pkgdir}"/opt/WindTerm_2.1.0 "${pkgdir}"/opt/WindTerm
	chmod -R 0755 "${pkgdir}"/opt/WindTerm
	mv "${pkgdir}"/opt/windterm.png "${pkgdir}"/usr/share/icons
	mv "${pkgdir}"/opt/windterm "${pkgdir}"/usr/bin
	mv "${pkgdir}"/opt/windterm.desktop "${pkgdir}"/usr/share/applications
	chmod +x "${pkgdir}"/opt/WindTerm/WindTerm
	chmod +x "${pkgdir}"/usr/bin/windterm
}
