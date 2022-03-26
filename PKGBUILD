# Maintainer: foldex <foldex (a) pm |dot| me>
pkgname=r2mod_cli
pkgver=1.3.2
pkgrel=1
pkgdesc="A Risk of Rain 2 Mod Manager."
arch=('any')
url="https://github.com/foldex/r2mod_cli"
license=('GPL3')
depends=('curl' 'findutils' 'gawk' 'jq' 'p7zip' 'sed')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('52208ca33a099464ba32e8360604320d51c9aed8cf9085e102b07e262028d1f8')

package() {
    cd "$pkgname-$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
