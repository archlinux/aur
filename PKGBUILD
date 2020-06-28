# Maintainer: Colin Woodbury <colin@fosskers.ca>
pkgname=credit-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="A fast tool for measuring Github repository contributions."
url="https://github.com/fosskers/credit"
license=("MIT")
arch=("x86_64")
provides=("credit")
options=("strip")
source=("https://github.com/fosskers/credit/releases/download/v$pkgver/credit-$pkgver-x86_64.tar.gz")
sha256sums=("c90e6cdd3828a83de27f3cf27f42c9779c921dfe3f768a3a94957210a448da6b")

package() {
    install -Dm755 credit -t "$pkgdir/usr/bin/"
}
