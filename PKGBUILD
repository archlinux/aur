# Maintainer: sagiri <i@sagiri.me>

pkgname=mob
pkgver=0.2.1_81
pkgrel=1
pkgdesc="一个高颜值并且实用的喜马拉雅桌面客户端。"
url="https://github.com/zenghongtu/Mob"
arch=('x86_64')
license=('TIM')
depends=('libxtst' 'gtk2' 'libxss' 'nss' 'gconf' 'alsa-lib')
install=${pkgname}.install

source=('https://github.com/zenghongtu/Mob/releases/download/v0.2.1/Mob-0.2.1-linux-amd64.deb')
md5sums=('381489074915522f8b34059585357ede')

package(){
	cd ${srcdir}

	tar -xJvf data.tar.xz -C "${pkgdir}"
	mkdir ${pkgdir}/usr/bin

#	ln -s ${pkgdir}/opt/Mob/mob ${pkgdir}/usr/bin/mob

}
