# Maintainer: Oleksandr Natalenko <oleksandr@natalenko.name>
# Contributor: Dmytri Kleiner <dk@trick.ca>
# Contributor: Matt Warner <mattwarner001@gmail.com>
# Contributor: Alessio Sergi <asergi at archlinux dot us>
# Contributor: Limao Luo <luolimao@gmail.com>

pkgname=spideroak-groups
pkgver=7.5.0
pkgrel=1
pkgdesc="Secure file backup, sync and sharing client. This provides the client for SpiderOak Groups / Enterprise"
arch=(x86_64)
url="https://spideroak.com/"
license=(custom)
depends=(desktop-file-utils)
options=(!strip)
install=${pkgname}.install
source=(https://spideroak.com/release/so.blue/rpm_x64
		terms.txt)
sha256sums=('36cfdd5db10351fee3fcd04e9be1339c21fc8ac276a2f45e59506ed0a1270041'
            '4819c8d923ab19e552e877b87adf1d45aca6adcb5dffcb238d7819501e6e6737')
package() {
	cp -r {etc,opt,usr} "${pkgdir}"
	install -Dt "${pkgdir}"/usr/share/licenses/"${pkgname}" -m0644 terms.txt
}

