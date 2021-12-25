# Maintainer: Huki <gk7huki@gmail.com>
# Contributor: Svitozar Cherepii <razotivs@gmail.com>

pkgname=rvgl-io-tracks
pkgver=21.1223
pkgrel=1
pkgdesc="Additional RVGL tracks used for official events."
url='https://re-volt.io/online/tracks'
arch=('any')
license=('custom')
depends=('rvgl-bin')
optdepends=('rvgl-io-loadlevel: custom load screens'
            'rvgl-io-music: extra music')
makedepends=('git')
conflicts=('rvgl-tracks')
replaces=('rvgl-tracks')
groups=('rvgl-community')
source=("rvgl_io_tracks"::git+https://gitlab.com/re-volt/rvio/tracks.git#tag=${pkgver})
sha256sums=('SKIP')

package() {
    cd "$srcdir/rvgl_io_tracks"
    find * -type f -exec install -Dm644 {} "$pkgdir/opt/rvgl/{}" \;
}
