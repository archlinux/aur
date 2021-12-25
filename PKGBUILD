# Maintainer: Huki <gk7huki@gmail.com>
# Contributor: Svitozar Cherepii <razotivs@gmail.com>

pkgname=rvgl-io-tracks-circuit
pkgver=21.1218
pkgrel=1
pkgdesc="Additional RVGL tracks used for drifting and other special events."
url='https://re-volt.io/online/tracks'
arch=('any')
license=('custom')
depends=('rvgl-bin')
optdepends=('rvgl-io-loadlevel: custom load screens'
            'rvgl-io-music: extra music')
makedepends=('git')
groups=('rvgl-community')
source=("rvgl_io_tracks_circuit"::git+https://gitlab.com/re-volt/rvio/circuit_tracks.git#tag=${pkgver})
sha256sums=('SKIP')

package() {
    cd "$srcdir/rvgl_io_tracks_circuit"
    find * -type f -exec install -Dm644 {} "$pkgdir/opt/rvgl/{}" \;
}
