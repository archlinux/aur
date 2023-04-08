# Maintainer: Huki <gk7huki@gmail.com>
# Contributor: Svitozar Cherepii <razotivs@gmail.com>

pkgname=rvgl-io-skins
pkgver=23.0303
pkgrel=1
pkgdesc="Additional skins for RVGL default and community cars."
url='https://re-volt.io/online/cars'
arch=('any')
license=('custom')
depends=('rvgl-bin')
optdepends=('rvgl-io-cars: additional cars for official events')
makedepends=('git')
conflicts=('rvgl-skins')
replaces=('rvgl-skins')
groups=('rvgl-online')
source=("rvgl_io_skins"::git+https://gitlab.com/re-volt/rvio/skins.git#tag=${pkgver})
sha256sums=('SKIP')

package() {
    cd "$srcdir/rvgl_io_skins"
    find * -type f -exec install -Dm644 {} "$pkgdir/opt/rvgl/{}" \;
}
