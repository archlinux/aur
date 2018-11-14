# Maintainer: dianlujitao <dianlujitao at gmail dot com>
pkgname=lang-sh
pkgdesc="Scripts from RedHat which provide fallback for CJK languages that can't be displayed in console."
pkgver=2.12.3
pkgrel=1
arch=('any')
url="https://pagure.io/setup"
license=('custom')
source=("https://pagure.io/setup/raw/master/f/lang.sh"
        "https://pagure.io/setup/raw/master/f/lang.csh")
sha256sums=('0a976e5199cd34a2f07623c50411050e3ce53a6c85b9f0eb88f943562dfe7006'
            'dee089f44e6deeda77ce016e480b137ba6b27aac2ff864769367c23dae186060')

package() {
	cd ${srcdir}
	install -Dm644 ${srcdir}/lang.csh ${pkgdir}/etc/profile.d/lang.csh
	install -Dm644 ${srcdir}/lang.sh ${pkgdir}/etc/profile.d/lang.sh
}
