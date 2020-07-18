# Maintainer: Colin Woodbury <colin@fosskers.ca>
pkgname=credit-bin
pkgver=1.1.1
pkgrel=1
pkgdesc="A fast tool for measuring Github repository contributions."
url="https://github.com/fosskers/credit"
license=("MIT")
arch=("x86_64")
provides=("credit")
options=("strip")
source=("https://github.com/fosskers/credit/releases/download/v$pkgver/credit-$pkgver-x86_64.tar.gz")
sha256sums=("8d5fafb0b8feeb255572a55f08f0a5a435827cad77d0a88861d15c80bbd2ca65")

package() {
    install -Dm755 credit -t "$pkgdir/usr/bin/"
}
