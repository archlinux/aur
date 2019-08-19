# Maintainer: Svitozar Cherepii <razotivs@gmail.com>
pkgname=rvgl-skins
pkgver=19.0701
pkgrel=1
pkgdesc="Additional RVGL skins for default and pack cars."
url='https://rvgl.re-volt.io'
arch=('any')
license=('custom')
depends=('rvgl-bin')
optdepends=('rvgl-cars: additional cars skins provided for'
            'rvgl-cars-bonus: additional cars skins provided for')
source=("$pkgname-$pkgver.zip::https://distribute.re-volt.io/packs/io_skins.zip")
sha256sums=('7c1e950f5d7ed03317bf3950fae895b9946f2b43e555125cae21f287b3c14706')

package() {
    find cars -type f -exec \
        install -Dm644 {} "$pkgdir/opt/rvgl/{}" \;
}
