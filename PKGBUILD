# Maintainer: Svitozar Cherepii <razotivs@gmail.com>
pkgname=rvgl-cars
pkgver=20.0120
pkgrel=1
pkgdesc="Additional RVGL cars used for official events."
url='https://rvgl.re-volt.io'
arch=('any')
license=('custom')
depends=('rvgl-bin')
optdepends=('rvgl-skins: additional car skins')
source=("$pkgname-$pkgver.zip::https://distribute.re-volt.io/packs/io_cars.zip")
sha256sums=('fca016f37c7402502ba7992c4d527b0d8a7da6514abb9eba2b80c9c032c9acf6')

package() {
    find cars -type f -exec \
        install -Dm644 {} "$pkgdir/opt/rvgl/{}" \;
}
