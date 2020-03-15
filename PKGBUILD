# Maintainer: Svitozar Cherepii <razotivs@gmail.com>
pkgname=rvgl-cars-bonus
pkgver=20.0303
pkgrel=1
pkgdesc="Additional RVGL cars no longer used for official events."
url='https://rvgl.re-volt.io'
arch=('any')
license=('custom')
depends=('rvgl-bin')
optdepends=('rvgl-skins: additional car skins')
source=("$pkgname-$pkgver.zip::https://distribute.re-volt.io/packs/io_cars_bonus.zip")
sha256sums=('416543aaaeaee43086e15b016e5f060bf92aa109624046f6f7773eec9d15fb7e')

package() {
    find cars -type f -exec \
        install -Dm644 {} "$pkgdir/opt/rvgl/{}" \;
}
