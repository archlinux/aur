# Maintainer: Huki <gk7huki@gmail.com>
# Contributor: Svitozar Cherepii <razotivs@gmail.com>

pkgname=rvgl-io-cars
pkgver=21.1218
pkgrel=1
pkgdesc="Additional RVGL cars used for official events."
url='https://re-volt.io/online/cars'
arch=('any')
license=('custom')
depends=('rvgl-bin')
optdepends=('rvgl-io-skins: additional car skins')
makedepends=('git')
conflicts=('rvgl-cars' 'rvgl-superpros')
replaces=('rvgl-cars' 'rvgl-superpros')
groups=('rvgl-community')
source=("rvgl_io_cars"::git+https://gitlab.com/re-volt/rvio/cars.git#tag=${pkgver})
sha256sums=('SKIP')

package() {
    cd "$srcdir/rvgl_io_cars"
    find * -type f -exec install -Dm644 {} "$pkgdir/opt/rvgl/{}" \;
}
