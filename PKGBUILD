# Maintainer: Svitozar Cherepii <razotivs@gmail.com>
pkgname=rvgl-music
pkgver=19.0415
pkgrel=1
pkgdesc="Extra music for RVGL additional community tracks."
url='https://rvgl.re-volt.io'
arch=('any')
license=('custom')
depends=('rvgl-bin')
optdepends=('rvgl-tracks: actual tracks music is used for'
            'rvgl-tracks-bonus: actual tracks music is used for')
source=("https://distribute.re-volt.io/packs/io_music.zip"
        "https://distribute.re-volt.io/releases/io_music.txt")
sha256sums=('bd65b82e6a9f18464a2a0310d606a4b59166c1d6c210b1f648c2c5cd1cda8d89'
            'SKIP')

pkgver() {
    cat io_music.txt
}

package() {
    find music -type f -exec \
        install -Dm644 {} "$pkgdir/opt/rvgl/{}" \;
}
