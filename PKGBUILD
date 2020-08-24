# Maintainer: Colin Woodbury <colin@fosskers.ca>
pkgname=credit-bin
pkgver=1.3.0
pkgrel=1
pkgdesc="A fast tool for measuring Github repository contributions."
url="https://github.com/fosskers/credit"
license=("MIT")
arch=("x86_64")
provides=("credit")
options=("strip")
source=("https://github.com/fosskers/credit/releases/download/v$pkgver/credit-$pkgver-x86_64.tar.gz")
sha256sums=("63cd017b5390e03aed9be608662743a0443c61471c805efff8e63e7a7b857489")

package() {
    install -Dm755 credit -t "$pkgdir/usr/bin/"
}
