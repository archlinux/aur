# Maintainer: Colin Woodbury <colin@fosskers.ca>
pkgname=credit-bin
pkgver=1.4.0
pkgrel=1
pkgdesc="A fast tool for measuring Github repository contributions."
url="https://github.com/fosskers/credit"
license=("MIT")
arch=("x86_64")
provides=("credit")
options=("strip")
source=("https://github.com/fosskers/credit/releases/download/v$pkgver/credit-$pkgver-x86_64.tar.gz")
sha256sums=("3034b9e570b0ff4143cca1d54eb2ad0705e3a4af283ee6fd7fd2729e82da23ea")

package() {
    install -Dm755 credit -t "$pkgdir/usr/bin/"
}
