# Maintainer: Huki <gk7huki@gmail.com>
# Contributor: Svitozar Cherepii <razotivs@gmail.com>

pkgname=rvgl-io-tracks-bonus
pkgver=21.1222
pkgrel=1
pkgdesc="Additional RVGL tracks used for special events."
url='https://re-volt.io/online/tracks'
arch=('any')
license=('custom')
depends=('rvgl-bin')
optdepends=('rvgl-io-loadlevel: custom load screens'
            'rvgl-io-music: extra music')
makedepends=('git')
conflicts=('rvgl-tracks-bonus')
replaces=('rvgl-tracks-bonus')
groups=('rvgl-community')
source=("rvgl_io_tracks_bonus"::git+https://gitlab.com/re-volt/rvio/bonus_tracks.git#tag=${pkgver})
sha256sums=('SKIP')

package() {
    cd "$srcdir/rvgl_io_tracks_bonus"
    find * -type f -exec install -Dm644 {} "$pkgdir/opt/rvgl/{}" \;
}
