pkgname=wine-dwproton-bin
pkgver=11.0
pkgrel=7
pkgdesc="dwproton的wine版"
url="https://dawn.wine/dawn-winery/wine-dwproton"
arch=("x86_64")
provides=(
  "wine=$pkgver"
  "wine-staging=$pkgver"
  "wine-wow64=$pkgver"
  "wine-dwproton=$pkgver"
)
conflicts=("wine")
source=(https://github.com/irtkll/wine-proton-patch/releases/download/$pkgname-$pkgver-$pkgrel/$pkgname-$pkgver-$pkgrel-x86_64.tar.xz)
sha256sums=('738609846b3581e4ed0b93f2ece76bb4b05f197a499078359483c2ecaf4e5379')
package(){
    cp -a $pkgname-$pkgver-$pkgrel-x86_64/. $pkgdir
}
