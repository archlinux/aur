# Maintainer: Svitozar Cherepii <razotivs@gmail.com>
pkgname=rvgl-cars
pkgver=20.0202
pkgrel=1
pkgdesc="Additional RVGL cars used for official events."
url='https://rvgl.re-volt.io'
arch=('any')
license=('custom')
depends=('rvgl-bin')
optdepends=('rvgl-skins: additional car skins')
source=("$pkgname-$pkgver.zip::https://distribute.re-volt.io/packs/io_cars.zip")
sha256sums=('2e26097881eb53ef117856c3428b5f750a7a040174df2f025623ab89b66574eb')

package() {
    find cars -type f -exec \
        install -Dm644 {} "$pkgdir/opt/rvgl/{}" \;
}
