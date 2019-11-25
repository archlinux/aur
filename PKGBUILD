# Maintainer: Svitozar Cherepii <razotivs@gmail.com>
pkgname=rvgl-cars
pkgver=19.1125
pkgrel=1
pkgdesc="Additional RVGL cars used for official events."
url='https://rvgl.re-volt.io'
arch=('any')
license=('custom')
depends=('rvgl-bin')
optdepends=('rvgl-skins: additional car skins')
source=("$pkgname-$pkgver.zip::https://distribute.re-volt.io/packs/io_cars.zip")
sha256sums=('117099d7fa69ed308d8626d2cb343f5130cd016aa0b871199f04cb6d81ce79fd')

package() {
    find cars -type f -exec \
        install -Dm644 {} "$pkgdir/opt/rvgl/{}" \;
}
