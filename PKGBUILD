# Maintainer: Colin Woodbury <colin@fosskers.ca>
pkgname=credit-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="A fast tool for measuring Github repository contributions."
url="https://github.com/fosskers/credit"
license=("MIT")
arch=("x86_64")
provides=("credit")
options=("strip")
source=("https://github.com/fosskers/credit/releases/download/v$pkgver/credit-$pkgver-x86_64.tar.gz")
sha256sums=("5ebfa9c68917834843e44e4c8a6ef82eb4bfb6219671be02ac82512bcc6461ca")

package() {
    install -Dm755 credit -t "$pkgdir/usr/bin/"
}
