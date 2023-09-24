# Maintainer: Huki <gk7huki@gmail.com>
# Contributor: Svitozar Cherepii <razotivs@gmail.com>

pkgname=rvgl-io-lms
pkgver=23.0923
pkgrel=1
pkgdesc="Additional Last Man Standing levels for RVGL."
url='https://re-volt.io/online/tracks/battle'
arch=('any')
license=('custom')
depends=('rvgl-bin')
makedepends=('git')
groups=('rvgl-bonus')
source=("rvgl_io_lms"::git+https://gitlab.com/re-volt/rvio/lms.git#tag=${pkgver})
sha256sums=('SKIP')

package() {
    cd "$srcdir/rvgl_io_lms"
    find * -type f -exec install -Dm644 {} "$pkgdir/opt/rvgl/{}" \;
}
