# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds
# Contributor: Jesús Jerez <jerezmoreno@gmail.com>
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
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/geany/$pkgname/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('8db169253c29aa7a4fb6eb6d881d5bb79ac3d14101e96bca6dcd7576c6d576c6f5632f30c209f67307a1e4b68bb7b619bf97e5195651003e0ca79f0efd37054c')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -dm755 "${pkgdir}"/usr/share/geany/colorschemes
	install -D -m644 colorschemes/* "${pkgdir}"/usr/share/geany/colorschemes/
}
