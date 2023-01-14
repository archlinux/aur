# Maintainer: foldex <foldex (a) pm |dot| me>
pkgname=r2mod_cli
pkgver=1.3.3
pkgrel=1
pkgdesc="A Risk of Rain 2 Mod Manager."
arch=('any')
url="https://github.com/foldex/r2mod_cli"
license=('GPL3')
depends=('curl' 'findutils' 'gawk' 'jq' 'p7zip' 'sed')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('ce3246afdb2789432f41c4547648233dfce7d5b2c6874ce1e849bb06f4a6fe38')

package() {
    cd "$pkgname-$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
