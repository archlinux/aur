# Maintainer: dianlujitao <dianlujitao at gmail dot com>
pkgname=lang-sh
pkgdesc="Scripts from RedHat which provide fallback for CJK languages that can't be displayed in console."
pkgver=2.13.6
pkgrel=1
arch=('any')
url="https://pagure.io/setup"
license=('custom')
source=("https://pagure.io/setup/raw/master/f/lang.sh"
        "https://pagure.io/setup/raw/master/f/lang.csh")
sha256sums=('58bf8b07428754b273560c5ea4040c672440b2bb04709842cf94163e15dc144f'
            '5486ae2358f54ba086017a5a7d89fc71855e4071c06fe1866a278838b465b161')

package() {
	cd ${srcdir}
	install -Dm644 ${srcdir}/lang.csh ${pkgdir}/etc/profile.d/lang.csh
	install -Dm644 ${srcdir}/lang.sh ${pkgdir}/etc/profile.d/lang.sh
}
