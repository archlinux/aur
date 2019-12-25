# Maintainer: Svitozar Cherepii <razotivs@gmail.com>
pkgname=rvgl-superpros
pkgver=19.1203
pkgrel=1
pkgdesc="Overpowered cars for RVGL special events."
url='https://rvgl.re-volt.io'
arch=('any')
license=('custom')
depends=('rvgl-bin')
source=("$pkgname-$pkgver.zip::https://distribute.re-volt.io/packs/io_superpros.zip")
sha256sums=('00c02b8398c88c77acb6af609626c1dcbea4a38e32f170f5b3bd406bda4d0662')

package() {
    find cars -type f -exec \
        install -Dm644 {} "$pkgdir/opt/rvgl/{}" \;
}
