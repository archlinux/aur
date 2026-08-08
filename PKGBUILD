pkgname=wine-dwproton-bin
pkgver=11.0
pkgrel=11
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
sha256sums=('6620fb7c318162a73ea1a49082f26eb6a788c1821851c9aba23e8ddf588b6af8')
package(){
    cp -a ${pkgname%-bin}-$pkgver-$pkgrel-x86_64/. $pkgdir
}
