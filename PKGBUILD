# Maintainer: Huki <gk7huki@gmail.com>
# Contributor: Svitozar Cherepii <razotivs@gmail.com>

pkgname=rvgl-io-cars-bonus
pkgver=21.1223
pkgrel=1
pkgdesc="Additional RVGL cars used for special events."
url='https://re-volt.io/online/cars'
arch=('any')
license=('custom')
depends=('rvgl-bin')
optdepends=('rvgl-io-skins-bonus: additional car skins')
makedepends=('git')
conflicts=('rvgl-cars-bonus')
replaces=('rvgl-cars-bonus')
groups=('rvgl-community')
source=("rvgl_io_cars_bonus"::git+https://gitlab.com/re-volt/rvio/bonus_cars.git#tag=${pkgver})
sha256sums=('SKIP')

package() {
    cd "$srcdir/rvgl_io_cars_bonus"
    find * -type f -exec install -Dm644 {} "$pkgdir/opt/rvgl/{}" \;
}
