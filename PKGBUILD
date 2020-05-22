# Maintainer: Huki <gk7huki@gmail.com>
# Contributor: Svitozar Cherepii <razotivs@gmail.com>

pkgname=rvgl-io-tracks-circuit
pkgver=20.0413
pkgrel=1
pkgdesc="Additional RVGL tracks used for drifting and other special events."
url='https://rvgl.re-volt.io'
arch=('any')
license=('custom')
depends=('rvgl-bin')
makedepends=('git')
groups=('rvgl-community')
source=("rvgl_io_tracks_circuit"::git+https://gitlab.com/re-volt/rvio/circuit_tracks.git#tag=${pkgver})
sha256sums=('SKIP')

package() {
    cd "$srcdir/rvgl_io_tracks_circuit"
    find * -type f -exec install -Dm644 {} "$pkgdir/opt/rvgl/{}" \;
}
