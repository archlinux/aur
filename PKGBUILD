# Maintainer: Colin Woodbury <colin@fosskers.ca>
pkgname=credit-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="A tool for measuring Github repository contributions."
url="https://github.com/fosskers/credit"
license=("MIT")
arch=("x86_64")
provides=("credit")
options=("strip")
source=("https://github.com/fosskers/credit/releases/download/v$pkgver/credit-$pkgver-x86_64.tar.gz")
sha256sums=("8631b73d1c0965060ad041cf0d11c6f5ca3f5f04cf059d6e4a50d0a8367c1cfb")

package() {
    install -Dm755 credit -t "$pkgdir/usr/bin/"
}
