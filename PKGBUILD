pkgname=wine-dwproton-bin
pkgver=11.0
pkgrel=9
pkgdesc="dwproton的wine版|dwproton's wine version"
url="https://dawn.wine/dawn-winery/wine-dwproton"
arch=("x86_64")
provides=(
  "wine=$pkgver"
  "wine-staging=$pkgver"
  "wine-wow64=$pkgver"
  "wine-dwproton=$pkgver"
)
conflicts=("wine")
source=(https://github.com/irtkll/wine-proton-patch/releases/download/${pkgname%-bin}-$pkgver-$pkgrel/${pkgname%-bin}-$pkgver-$pkgrel-x86_64.tar.xz)
sha256sums=('1c2f5ee9a2cfd7fa9330e0a5bccc287c1efbe85a7073afffcd4c2bc03e8192e4')
package(){
    cp -a ${pkgname%-bin}-$pkgver-$pkgrel-x86_64/. $pkgdir
}
