# Maintainer: Svitozar Cherepii <razotivs@gmail.com>
pkgname=rvgl-cars
pkgver=20.0413
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
sha256sums=('bcb6db5469cef57a14dd6bb0ff953b77c94ecb23471f1bfef5292dc40dfcf7a8')

package() {
    find cars -type f -exec \
        install -Dm644 {} "$pkgdir/opt/rvgl/{}" \;
}
