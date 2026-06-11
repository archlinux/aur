# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Simon Legner <Simon.Legner@gmail.com>
pkgname=spectre-meltdown-checker
pkgver=26.36.0602723
pkgrel=1
pkgdesc="Check system resilience against transient execution CVEs published since 2018"
arch=('any')
url="https://github.com/speed47/spectre-meltdown-checker"
license=(GPL-3.0-only)
source=("$pkgname-$pkgver.tar.gz::https://github.com/speed47/$pkgname/archive/v$pkgver.tar.gz")
b2sums=('1c5aee6cdc2cc1af489c1d400ffaec6ff1dcf670296487e3fa798865bb755386ad811c691a858202f8427752a6c1423fd18644de359620fd113050e141c2289f')

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 spectre-meltdown-checker.sh "$pkgdir/usr/bin/spectre-meltdown-checker"
}
