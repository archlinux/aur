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
sha256sums=('153ad913a5856d009ec61845a540d096fa170117c57e266f972ae660e529c894'
            '96dd59cc2b913f82c850e9a792add13d65ece08f1b250fa0f52c88687a5ec8bb'
            'f417826fed3c1c192468374f476b39b6d8c0ae815314569e4aa8004f4bcaaaa4')

package() {
	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p "${pkgdir}/usr/include"
	mkdir -p "${pkgdir}/usr/share/man/man1"
	install -m=777 nitrond.1.gz ${pkgdir}/usr/share/man/man1/nitrond.1.gz
	install -m=777 nitrond ${pkgdir}/usr/bin/nitrond
	install -m=777 nitronapi.sh ${pkgdir}/usr/include/nitronapi.sh
}
