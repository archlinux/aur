# Maintainer: UsiFX <xprjkts@gmail.com>

pkgbase=nitronx
pkgname=nitronx
pkgver=1.2.0
pkgrel=10
pkgdesc="Extensive, Enhanced linux kernel tweaker written in BASH"
arch=(any)
url="https://github.com/UsiFX/OpenNitroN"
license=('GPL3')
source=("nitrond" "nitronapi.sh" "nitrond.1.gz")
sha256sums=('b9799f6883734ddcbbdcc988e8c4f2ab830319612952681122391a43faefcb1a'
            '115aceeada2859ab349275a98c3f36937404948abfd188bfff6df9cadfd831c8'
            '95b1327e89a50e16fef849f0136b3e834e0be85ac3dd673217389fd0f51ebf52')

package() {
	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p "${pkgdir}/usr/include"
	mkdir -p "${pkgdir}/usr/share/man/man1"
	install -m=777 nitrond.1.gz ${pkgdir}/usr/share/man/man1/nitrond.1.gz
	install -m=777 nitrond ${pkgdir}/usr/bin/nitrond
	install -m=777 nitronapi.sh ${pkgdir}/usr/include/nitronapi.sh
}
