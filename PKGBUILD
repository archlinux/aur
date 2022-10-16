# Maintainer: Rakshith Ravi <rakshith.ravi@vicara.co>
pkgname=patr-bin
pkgver=0.2.1
pkgrel=1
makedepends=('cargo')
arch=('x86_64')
pkgdesc="CLI app for interacting with patr resources"
url="https://patr.cloud"
source=("file:///build/patr-0.2.1.tar.xz")
license=('MIT')
md5sums=('SKIP')
# sha256sum=("539517cd61bf1657e40a5ffc099f90c6fda82d4eea700b361f97a494c2ca6ba7")

package() {
    install -Dm755 patr -t "$pkgdir/usr/bin"
}
