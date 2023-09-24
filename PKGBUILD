# Maintainer: Huki <gk7huki@gmail.com>
# Contributor: Svitozar Cherepii <razotivs@gmail.com>

pkgname=rvgl-io-skins-bonus
pkgver=23.0923
pkgrel=1
pkgdesc="Additional skins for RVGL default and community cars."
url='https://re-volt.io/online/cars'
arch=('any')
license=('custom')
depends=('rvgl-bin')
optdepends=('rvgl-io-cars: additional cars for official events'
            'rvgl-io-cars-bonus: additional cars')
makedepends=('git')
groups=('rvgl-bonus')
source=("rvgl_io_skins_bonus"::git+https://gitlab.com/re-volt/rvio/bonus_skins.git#tag=${pkgver})
sha256sums=('SKIP')

package() {
    cd "$srcdir/rvgl_io_skins_bonus"
    find * -type f -exec install -Dm644 {} "$pkgdir/opt/rvgl/{}" \;
}
