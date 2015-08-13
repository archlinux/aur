# Maintainer: Jesús Jerez <jerezmoreno@gmail.com>
# collaborator: Alessio Sergi <asergi@archlinux.us>
# Contributor: Sagar Chalise <chalisesagar@gmail.com>

pkgname=geany-themes
pkgver=1.24
pkgrel=1
pkgdesc='A collection of color schemes for Geany.'
arch=('any')
url='https://git.geany.org/geany-themes/'
license=('GPL')
depends=('geany')
source=("https://git.geany.org/$pkgname/snapshot/$pkgname-${pkgver}.tar.gz")
sha1sums=('45063d57079e9f444c677f0d78b5c0d47653bfa5')

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	install -dm755 ${pkgdir}/usr/share/geany/colorschemes
	install -D -m644 colorschemes/* ${pkgdir}/usr/share/geany/colorschemes/
}
