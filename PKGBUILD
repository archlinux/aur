# Maintainer: Eric Zhao <21zhaoe@protonmail.com>
pkgbase=ttf-santakku
pkgname=ttf-santakku
pkgver=20210910
pkgrel=1
pkgdesc='Old Babylonian cuneiform fonts'
provides=(ttf-santakku)
arch=(any)
url='https://www.hethport.uni-wuerzburg.de/cuneifont/'
license=('CC-BY-SA-4.0')
source=(https://www.hethport.uni-wuerzburg.de/cuneifont/download/Santakku.zip)
sha256sums=('62283f4c3f1b9f4be920fa8906485874607c71b780edc27c3f421b7f4c4a3606')

package_ttf-santakku() {
  install -Dm644 Santakku.ttf -t "$pkgdir"/usr/share/fonts/TTF/
  install -Dm644 SantakkuM.ttf -t "$pkgdir"/usr/share/fonts/TTF/
}
