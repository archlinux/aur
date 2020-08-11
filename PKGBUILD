# Maintainer: Colin Woodbury <colin@fosskers.ca>
pkgname=credit-bin
pkgver=1.2.1
pkgrel=1
pkgdesc="A fast tool for measuring Github repository contributions."
url="https://github.com/fosskers/credit"
license=("MIT")
arch=("x86_64")
provides=("credit")
options=("strip")
source=("https://github.com/fosskers/credit/releases/download/v$pkgver/credit-$pkgver-x86_64.tar.gz")
sha256sums=("2428ed785296324b81381331b7322943cd12bacb933810ba4819da95c7ab0df6")

package() {
    install -Dm755 credit -t "$pkgdir/usr/bin/"
}
