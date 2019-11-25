# Maintainer: Svitozar Cherepii <razotivs@gmail.com>
pkgname=rvgl-skins
pkgver=19.1125
pkgrel=1
pkgdesc="Additional RVGL skins for default and pack cars."
url='https://rvgl.re-volt.io'
arch=('any')
license=('custom')
depends=('rvgl-bin')
optdepends=('rvgl-cars: additional cars skins provided for'
            'rvgl-cars-bonus: additional cars skins provided for')
source=("$pkgname-$pkgver.zip::https://distribute.re-volt.io/packs/io_skins.zip")
sha256sums=('fc944a5b472765472d65b5121d89cdcaf85b7899cebf5a8873ca82ce5e940b66')

package() {
    find cars -type f -exec \
        install -Dm644 {} "$pkgdir/opt/rvgl/{}" \;
}
