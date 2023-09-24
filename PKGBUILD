# Maintainer: Huki <gk7huki@gmail.com>
# Contributor: Svitozar Cherepii <razotivs@gmail.com>

pkgname=rvgl-io-cars-bonus
pkgver=23.0923
pkgrel=1
pkgdesc="Additional RVGL cars used for special events."
url='https://re-volt.io/online/cars/bonus'
arch=('any')
license=('custom')
depends=('rvgl-bin')
optdepends=('rvgl-io-skins-bonus: additional car skins')
makedepends=('git')
conflicts=('rvgl-cars-bonus')
replaces=('rvgl-cars-bonus')
groups=('rvgl-bonus')
source=("rvgl_io_cars_bonus"::git+https://gitlab.com/re-volt/rvio/bonus_cars.git#tag=${pkgver})
sha256sums=('SKIP')

package() {
    cd "$srcdir/rvgl_io_cars_bonus"
    find * -type f -exec install -Dm644 {} "$pkgdir/opt/rvgl/{}" \;
}
