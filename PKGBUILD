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
            '02592efe986e7915c5f6b16b49162b5421b8f990bf83666e8d0932464653b905'
            'ec96e986745a68177e79b574820b6eb583300cde2ba477c8530d3cf18347bd80')

package() {
	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p "${pkgdir}/usr/include"
	mkdir -p "${pkgdir}/usr/share/man/man1"
	install -m=777 nitrond.1.gz ${pkgdir}/usr/share/man/man1/nitrond.1.gz
	install -m=777 nitrond ${pkgdir}/usr/bin/nitrond
	install -m=777 nitronapi.sh ${pkgdir}/usr/include/nitronapi.sh
}
