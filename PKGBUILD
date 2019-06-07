# Maintainer: sagiri <i@sagiri.me>

pkgname=mob-bin
pkgver=0.2.2
pkgrel=1
pkgdesc="一个高颜值并且实用的喜马拉雅桌面客户端。"
url="https://github.com/zenghongtu/Mob"
arch=('x86_64')
license=('MIT')
depends=('libxtst' 'gtk2' 'libxss' 'nss' 'gconf' 'alsa-lib')
install=${pkgname}.install

source=("https://github.com/zenghongtu/Mob/releases/download/v${pkgver}/Mob-${pkgver}-linux-amd64.deb")
md5sums=('0c4cf85b862161ed9d19b014360f46f9')

package(){
	cd ${srcdir}

	tar -xJvf data.tar.xz -C "${pkgdir}"
	mkdir ${pkgdir}/usr/bin

#	ln -s ${pkgdir}/opt/Mob/mob ${pkgdir}/usr/bin/mob

}
