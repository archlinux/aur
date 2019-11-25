# Maintainer: Svitozar Cherepii <razotivs@gmail.com>
pkgname=rvgl-cars-bonus
pkgver=19.1125
pkgrel=1
pkgdesc="Additional RVGL cars no longer used for official events."
url='https://rvgl.re-volt.io'
arch=('any')
license=('custom')
depends=('rvgl-bin')
optdepends=('rvgl-skins: additional car skins')
source=("$pkgname-$pkgver.zip::https://distribute.re-volt.io/packs/io_cars_bonus.zip")
sha256sums=('86c3e2d67efa66b4ea6dfb20417221fb4a3e83cad74dfc1642803398b5e74d7a')

package() {
    find cars -type f -exec \
        install -Dm644 {} "$pkgdir/opt/rvgl/{}" \;
}
