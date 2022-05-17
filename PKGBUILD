# Maintainer: Huki <gk7huki@gmail.com>
# Contributor: Svitozar Cherepii <razotivs@gmail.com>

pkgname=rvgl-io-soundtrack
pkgver=20.0302
pkgrel=3
pkgdesc="RVGL community-made soundtrack."
url='https://re-volt.io/downloads/packs'
arch=('any')
license=('custom')
depends=('rvgl-bin')
makedepends=('git')
provides=('rvgl-soundtrack')
conflicts=('rvgl-soundtrack')
groups=('rvgl-online')
source=("rvgl_io_soundtrack"::git+https://gitlab.com/re-volt/rvio/ost.git#tag=${pkgver})
sha256sums=('SKIP')

package() {
    cd "$srcdir/rvgl_io_soundtrack"
    find * -type f -exec install -Dm644 {} "$pkgdir/opt/rvgl/{}" \;
}
