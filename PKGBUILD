# Maintainer: Svitozar Cherepii <razotivs@gmail.com>
pkgname=rvgl-superpros
pkgver=20.0202
pkgrel=1
pkgdesc="Overpowered cars for RVGL special events."
url='https://rvgl.re-volt.io'
arch=('any')
license=('custom')
depends=('rvgl-bin')
source=("$pkgname-$pkgver.zip::https://distribute.re-volt.io/packs/io_superpros.zip")
sha256sums=('cb786150d8b2ce7b46ef6e834a225db7f926bcd522d1e211b11b7786db2cdf62')

package() {
    find cars -type f -exec \
        install -Dm644 {} "$pkgdir/opt/rvgl/{}" \;
}
