# Maintainer: Sematre <sematre at gmx dot de>
pkgname=innounp-bin
pkgver=0.50
pkgrel=1

pkgdesc="Unpacker for installations made by Inno Setup."
arch=('x86_64')
url="http://innounp.sourceforge.net/"
license=('GPL')
depends=('wine')
source=("${pkgname}-${pkgver}.rar::https://nav.dl.sourceforge.net/project/innounp/innounp/innounp%20${pkgver}/innounp${pkgver/./}.rar"
        "start-innounp.sh")
sha256sums=('1d8837540ccc15d98245a1c73fd08f404b2a7bdfe7dc9bed2fdece818ff6df67'
            '6197b67dd0ab016d5fe6059ea779b440a3a8d28b1e83ec19c02321113eaaf0b1')

package() {
	install -Dm644 "innounp.exe"      -t "${pkgdir}/usr/share/innounp"
	install -Dm755 "start-innounp.sh"    "${pkgdir}/usr/bin/innounp"

	install -Dm644 "innounp.htm"      -t "${pkgdir}/usr/share/doc/innounp"
}
