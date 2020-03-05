# Maintainer: Svitozar Cherepii <razotivs@gmail.com>
pkgname=rvgl-skins
pkgver=20.0302
pkgrel=1
pkgdesc="Additional RVGL skins for default and pack cars."
url='https://rvgl.re-volt.io'
arch=('any')
license=('custom')
depends=('rvgl-bin')
optdepends=('rvgl-cars: additional cars skins provided for'
            'rvgl-cars-bonus: additional cars skins provided for')
source=("$pkgname-$pkgver.zip::https://distribute.re-volt.io/packs/io_skins.zip")
sha256sums=('20749cf4c146329d2ef4916a42f1822d2318b9aec196d744692e874616d53fea')

package() {
    rm cars/selsia/carcelicapp.bmp
    find cars -type f -exec \
        install -Dm644 {} "$pkgdir/opt/rvgl/{}" \;
}
