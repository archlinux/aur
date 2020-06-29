# Maintainer: Colin Woodbury <colin@fosskers.ca>
pkgname=credit-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="A fast tool for measuring Github repository contributions."
url="https://github.com/fosskers/credit"
license=("MIT")
arch=("x86_64")
provides=("credit")
options=("strip")
source=("https://github.com/fosskers/credit/releases/download/v$pkgver/credit-$pkgver-x86_64.tar.gz")
sha256sums=("4aeaaa7fd126169ac38c3ec3807310ccc824c33aeadd30c4e9509858c18708cf")

package() {
    install -Dm755 credit -t "$pkgdir/usr/bin/"
}
