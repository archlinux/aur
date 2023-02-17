# Maintainer: Relwi <theofficialdork@hotmail.com>
pkgname=ttf-cozette
_pkgname=CozetteFonts
pkgver=1.19.1
pkgrel=1
pkgdesc='A bitmap programming font optimized for coziness'
url='https://github.com/slavfox/Cozette'
source=("$pkgname-$pkgver.zip::https://github.com/slavfox/Cozette/releases/download/v.$pkgver/$_pkgname.zip")
arch=(any)
license=(MIT)
sha256sums=('34ce2d1f9487ed639b6de914fed0f72d0caf729ba90326fb2c141f33c34fe4fc')

package() {
  cd "$_pkgname"
  install -d "${pkgdir}/usr/share/fonts/TTF/"
  install -Dm644 "CozetteVector.ttf" -t "${pkgdir}/usr/share/fonts/TTF/"
  install -D "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
