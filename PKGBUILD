# Maintainer: dianlujitao <dianlujitao at gmail dot com>
pkgname=lang-sh
pkgdesc="Scripts from RedHat which provide fallback for CJK languages that can't be displayed in console."
pkgver=2.0
pkgrel=1
arch=('any')
url="https://pagure.io/setup"
license=('custom')
source=("https://pagure.io/setup/raw/master/f/lang.sh"
        "https://pagure.io/setup/raw/master/f/lang.csh")
sha256sums=('0a976e5199cd34a2f07623c50411050e3ce53a6c85b9f0eb88f943562dfe7006'
            '875ca102ae4e46d071c3d135f77a43775016d3e86765062fc179f0acb82e145f')

package() {
	cd ${srcdir}
	install -Dm644 ${srcdir}/lang.csh ${pkgdir}/etc/profile.d/lang.csh
	install -Dm644 ${srcdir}/lang.sh ${pkgdir}/etc/profile.d/lang.sh
}
