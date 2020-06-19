# Maintainer: Colin Woodbury <colin@fosskers.ca>
pkgname=credit-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="A tool for measuring Github repository contributions"
url="https://github.com/fosskers/credit"
license=("MIT")
arch=("x86_64")
provides=("credit")
options=("strip")
source=("https://github.com/fosskers/credit/releases/download/v$pkgver/credit-$pkgver-x86_64.tar.gz")
sha256sums=("bf29759298ba70ceb68610c5fc029d7faee937e04bcd935a2e7defcb428fe8af")

package() {
    install -Dm755 credit -t "$pkgdir/usr/bin/"
}
