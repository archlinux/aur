# Maintainer: SanskritFritz (gmail)

pkgname=ttf-philosopher-google
pkgver=20110831
pkgrel=2
pkgdesc="Universal font inspired by Agfa Rotis and ITC Binary. Extended by Google-fonts."
arch=(any)
license=(OFL)
url='https://fonts.google.com/specimen/Philosopher'
depends=()
source=("Philosopher-$pkgver.zip::https://fonts.google.com/download?family=Philosopher")
md5sums=('c22c9ed23a6ac5ccb8956d1bd0253847')

package() {

  install -d "$pkgdir"/usr/share/fonts/TTF/
  install -m644 *.ttf "$pkgdir"/usr/share/fonts/TTF/
}
