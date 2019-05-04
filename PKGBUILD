# Maintainer: Svitozar Cherepii <razotivs@gmail.com>
pkgname=rvgl-tracks-bonus
pkgver=19.0414
pkgrel=1
pkgdesc="Additional RVGL tracks not used for official events."
url='https://rvgl.re-volt.io'
arch=('any')
license=('custom')
depends=('rvgl-bin')
optdepends=('rvgl-loadlevel: custom load screens'
            'rvgl-music: music for levels')
source=("https://distribute.re-volt.io/packs/io_tracks_bonus.zip"
        "https://distribute.re-volt.io/releases/io_tracks_bonus.txt")
sha256sums=('13376c13e0ac70b97c97a709cbfa88e668046a0fc4666738a406cb2b0316bceb'
            'SKIP')

pkgver() {
    cat io_tracks_bonus.txt
}

package() {
    find gfx levels -type f -exec \
        install -Dm644 {} "$pkgdir/opt/rvgl/{}" \;
}
