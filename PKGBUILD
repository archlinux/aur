# Maintainer: Svitozar Cherepii <razotivs@gmail.com>
pkgname=rvgl-tracks-bonus
pkgver=20.0202
pkgrel=1
pkgdesc="Additional RVGL tracks no longer used for official events."
url='https://rvgl.re-volt.io'
arch=('any')
license=('custom')
depends=('rvgl-bin')
optdepends=('rvgl-loadlevel: custom load screens'
            'rvgl-music: music for levels')
source=("$pkgname-$pkgver.zip::https://distribute.re-volt.io/packs/io_tracks_bonus.zip")
sha256sums=('e8fa4e101f50a7c0130c291a4f7a5fd9fbb914ebcd715628d7785a92487d7d27')

package() {
    find gfx levels -type f -exec \
        install -Dm644 {} "$pkgdir/opt/rvgl/{}" \;
}
