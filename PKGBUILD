# Maintainer: SanskritFritz (gmail)

pkgname=ttf-philosopher-google
pkgver=20110831
pkgrel=1
pkgdesc="Universal font inspired by Agfa Rotis and ITC Binary. Extended by Google-fonts."
arch=(any)
license=(OFL)
url='https://fonts.google.com/specimen/Philosopher'
depends=()
source=("https://fonts.google.com/download?family=Philosopher")
md5sums=('87df65b81843f479c7f3577d7ea2b918')

package() {

  install -d "$pkgdir"/usr/share/fonts/TTF/
  install -m644 *.ttf "$pkgdir"/usr/share/fonts/TTF/
}
