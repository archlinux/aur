# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Simon Legner <Simon.Legner@gmail.com>
pkgname=spectre-meltdown-checker
pkgver=26.36.0913490
pkgrel=1
pkgdesc="Check system resilience against transient execution CVEs published since 2018"
arch=('any')
url="https://github.com/speed47/spectre-meltdown-checker"
license=(GPL-3.0-only)
source=("$pkgname-$pkgver.tar.gz::https://github.com/speed47/$pkgname/archive/v$pkgver.tar.gz")
b2sums=('11e0aa4c2250e0b43047e6d683abac1333854d760147606961445a081d8dcc4a61f0cab2266d02d7cc50d2ddb216c312ee92d88bacab344586afefa5a38738e4')

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 spectre-meltdown-checker.sh "$pkgdir/usr/bin/spectre-meltdown-checker"
}
