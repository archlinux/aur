# Maintainer: Svitozar Cherepii <razotivs@gmail.com>
pkgname=rvgl-superpros
pkgver=19.1126
pkgrel=1
pkgdesc="Overpowered cars for RVGL special events."
url='https://rvgl.re-volt.io'
arch=('any')
license=('custom')
depends=('rvgl-bin')
source=("$pkgname-$pkgver.zip::https://distribute.re-volt.io/packs/io_superpros.zip")
sha256sums=('f1ea2f823de413c170c55d2b5f6cb6562ea4f76c5a28e75166a01a200a2a087d')

package() {
    find cars -type f -exec \
        install -Dm644 {} "$pkgdir/opt/rvgl/{}" \;
}
