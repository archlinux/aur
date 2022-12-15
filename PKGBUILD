# Maintainer: Relwi <theofficialdork@hotmail.com>
pkgname=ttf-cozette
_pkgname=CozetteFonts
pkgver=1.19.0
pkgrel=1
pkgdesc='A bitmap programming font optimized for coziness'
url='https://github.com/slavfox/Cozette'
source=("$pkgname-$pkgver.zip::https://github.com/slavfox/Cozette/releases/download/v.$pkgver/$_pkgname.zip")
arch=(any)
license=(MIT)
sha256sums=('988ba22b8d72dca9afacc86d848755ce81daec752d7d471533264bec5d04c21a')

package() {
  cd "$_pkgname"
  install -d "${pkgdir}/usr/share/fonts/TTF/"
  install -Dm644 "CozetteVector.ttf" -t "${pkgdir}/usr/share/fonts/TTF/"
  install -D "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
