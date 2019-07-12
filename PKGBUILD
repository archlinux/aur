# Maintainer: dianlujitao <dianlujitao at gmail dot com>
pkgname=lang-sh
pkgdesc="Scripts from RedHat which provide fallback for CJK languages that can't be displayed in console."
pkgver=2.13.3
pkgrel=1
arch=('any')
url="https://pagure.io/setup"
license=('custom')
source=("https://pagure.io/setup/raw/master/f/lang.sh"
        "https://pagure.io/setup/raw/master/f/lang.csh")
sha256sums=('597add8fe85c1a137983a23634647802defdce44ac2abac2b2b11065dde04fd4'
            'a13babc1459db736847ad11677b8a7f460268f0dd04f11b3ff9040ce52bb52b2')

package() {
	cd ${srcdir}
	install -Dm644 ${srcdir}/lang.csh ${pkgdir}/etc/profile.d/lang.csh
	install -Dm644 ${srcdir}/lang.sh ${pkgdir}/etc/profile.d/lang.sh
}
