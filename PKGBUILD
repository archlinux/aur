pkgname=wine-dwproton-bin
pkgver=11.0
pkgrel=12
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
sha256sums=('86eb2fd13be74347e8e33fa166e7984c44ea57ee274d968b77fd0b933e32cfc9')
package(){
    cp -a ${pkgname%-bin}/. $pkgdir
}
