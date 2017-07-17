# Maintainer: Azat Abdullin <abdullin@kspt.icc.spbstu.ru>

pkgname=plymouth-theme-polyspinner-light
pkgver=1
pkgrel=1
pkgdesc='Plymouth theme with Peter the Great St.Petersburg Polytechnic University logo.'
arch=('any')
url='https://gitlab.com/PhonePi'
license=('GPL')
depends=('plymouth')
source=('git+https://git.ejiek.com/KSPT/polyspinner-light-plymouth')
sha256sums=('SKIP')

package() {
	cd "${srcdir}/polyspinner-light-plymouth"
	rm -fv *~
	mkdir -p "${pkgdir}/usr/share/plymouth/themes/polyspinner-light"
	install -Dvm644 * "${pkgdir}/usr/share/plymouth/themes/polyspinner-light"
}
