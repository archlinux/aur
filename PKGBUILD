# Maintainer: Huki <gk7huki@gmail.com>
# Contributor: Svitozar Cherepii <razotivs@gmail.com>

pkgname=rvgl-io-music
pkgver=23.0923
pkgrel=1
pkgdesc="Extra music for RVGL community tracks."
url='https://re-volt.io/online/tracks'
arch=('any')
license=('custom')
depends=('rvgl-bin')
optdepends=('rvgl-io-tracks: additional tracks for official events'
            'rvgl-io-tracks-bonus: additional tracks'
            'rvgl-io-tracks-circuit: circuit tracks')
makedepends=('git')
conflicts=('rvgl-music')
replaces=('rvgl-music')
groups=('rvgl-online')
source=("rvgl_io_music"::git+https://gitlab.com/re-volt/rvio/music.git#tag=${pkgver})
sha256sums=('SKIP')

package() {
    cd "$srcdir/rvgl_io_music"
    find * -type f -exec install -Dm644 {} "$pkgdir/opt/rvgl/{}" \;
}
