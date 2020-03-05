# Maintainer: Svitozar Cherepii <razotivs@gmail.com>
pkgname=rvgl-cars
pkgver=20.0303
pkgrel=1
pkgdesc="Additional RVGL cars used for official events."
url='https://rvgl.re-volt.io'
arch=('any')
license=('custom')
depends=('rvgl-bin')
optdepends=('rvgl-skins: additional car skins')
provides=('rvgl-superpros')
conflicts=('rvgl-superpros')
source=("$pkgname-$pkgver.zip::https://distribute.re-volt.io/packs/io_cars.zip")
sha256sums=('93bd0cf8e45bd96d515967b2a4deb59cd3c6c90046e38e540dc8393ffa069804')

package() {
    find cars -type f -exec \
        install -Dm644 {} "$pkgdir/opt/rvgl/{}" \;
}
