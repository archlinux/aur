# Maintainer: Eric Zhao <21zhaoe@protonmail.com>
pkgbase=ttf-ullikummi
pkgname=ttf-ullikummi
pkgver=20210910
pkgrel=1
pkgdesc='Hittite cuneiform fonts'
provides=(ttf-ullikummi)
arch=(any)
url='https://www.hethport.uni-wuerzburg.de/cuneifont/'
license=('CC-BY-SA-4.0')
source=(https://www.hethport.uni-wuerzburg.de/cuneifont/download/Ullikummi.zip)
sha256sums=('28f8bb7ebc572009760066373edbf730c5bbcc2e974ec85109a6a44e5a2e55c7')

package_ttf-ullikummi() {
  install -Dm644 UllikummiA.ttf -t "$pkgdir"/usr/share/fonts/TTF/
  install -Dm644 UllikummiB.ttf -t "$pkgdir"/usr/share/fonts/TTF/
  install -Dm644 UllikummiC.ttf -t "$pkgdir"/usr/share/fonts/TTF/
}
