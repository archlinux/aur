# Maintainer: Huki <gk7huki@gmail.com>
# Contributor: Svitozar Cherepii <razotivs@gmail.com>

pkgname=rvgl-io-tag
pkgver=23.0923
pkgrel=1
pkgdesc="Additional Battle Tag levels for RVGL."
url='https://re-volt.io/online/tracks/battle'
arch=('any')
license=('custom')
depends=('rvgl-bin')
makedepends=('git')
groups=('rvgl-bonus')
source=("rvgl_io_tag"::git+https://gitlab.com/re-volt/rvio/battle-tag.git#tag=${pkgver})
sha256sums=('SKIP')

package() {
    cd "$srcdir/rvgl_io_tag"
    find * -type f -exec install -Dm644 {} "$pkgdir/opt/rvgl/{}" \;
}
