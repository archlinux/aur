# Maintainer: Svitozar Cherepii <razotivs@gmail.com>
pkgname=rvgl-music
pkgver=20.0302
pkgrel=1
pkgdesc="Extra music for RVGL additional community tracks."
url='https://rvgl.re-volt.io'
arch=('any')
license=('custom')
depends=('rvgl-bin')
optdepends=('rvgl-tracks: actual tracks music is used for'
            'rvgl-tracks-bonus: actual tracks music is used for')
source=("$pkgname-$pkgver.zip::https://distribute.re-volt.io/packs/io_music.zip")
sha256sums=('63edebb2fc5a02569d4b46601cc8cdd223ef7c5179fbf4c43f36b51ac6d46796')

package() {
    find music -type f -exec \
        install -Dm644 {} "$pkgdir/opt/rvgl/{}" \;
}
