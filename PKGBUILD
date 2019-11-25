# Maintainer: Svitozar Cherepii <razotivs@gmail.com>
pkgname=rvgl-tracks-bonus
pkgver=19.1125
pkgrel=1
pkgdesc="Additional RVGL tracks no longer used for official events."
url='https://rvgl.re-volt.io'
arch=('any')
license=('custom')
depends=('rvgl-bin')
optdepends=('rvgl-loadlevel: custom load screens'
            'rvgl-music: music for levels')
source=("$pkgname-$pkgver.zip::https://distribute.re-volt.io/packs/io_tracks_bonus.zip")
sha256sums=('99929b9ac34cf94da50e782990ce3f65f1d19b0a296bf19da8e53d8a2e134efb')

package() {
    find gfx levels -type f -exec \
        install -Dm644 {} "$pkgdir/opt/rvgl/{}" \;
}
