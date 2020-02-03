# Maintainer: Svitozar Cherepii <razotivs@gmail.com>
pkgname=rvgl-cars-bonus
pkgver=20.0202
pkgrel=1
pkgdesc="Additional RVGL cars no longer used for official events."
url='https://rvgl.re-volt.io'
arch=('any')
license=('custom')
depends=('rvgl-bin')
optdepends=('rvgl-skins: additional car skins')
source=("$pkgname-$pkgver.zip::https://distribute.re-volt.io/packs/io_cars_bonus.zip")
sha256sums=('61b61504ec2cd48d443af6f3c3d001e07b7866f82029e97e276609f6295b8ff9')

package() {
    find cars -type f -exec \
        install -Dm644 {} "$pkgdir/opt/rvgl/{}" \;
}
