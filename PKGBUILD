# Contributor: Ondřej Šponar
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=lexend-fonts-git
pkgver=r92.2049188
pkgrel=1
epoch=1
pkgdesc='Lexend is a variable typeface designed to improve reading fluency'
url="https://lexend.com"
arch=(any)
license=(custom:OFL-1.1)
makedepends=('git')
conflicts=('lexend-fonts')
provides=('lexend-fonts')
source=('lexend-fonts-git::git+https://github.com/googlefonts/lexend')
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "r%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

package() {
  install -Dm644 $pkgname/fonts/deca/ttf/LexendDeca-Regular.ttf "$pkgdir/usr/share/fonts/TTF/LexendDeca-Regular.ttf"
  install -Dm644 $pkgname/fonts/exa/ttf/LexendExa-Regular.ttf "$pkgdir/usr/share/fonts/TTF/LexendExa-Regular.ttf"
  install -Dm644 $pkgname/fonts/giga/ttf/LexendGiga-Regular.ttf "$pkgdir/usr/share/fonts/TTF/LexendGiga-Regular.ttf"
  install -Dm644 $pkgname/fonts/mega/ttf/LexendMega-Regular.ttf "$pkgdir/usr/share/fonts/TTF/LexendMega-Regular.ttf"
  install -Dm644 $pkgname/fonts/peta/ttf/LexendPeta-Regular.ttf "$pkgdir/usr/share/fonts/TTF/LexendPeta-Regular.ttf"
  install -Dm644 $pkgname/fonts//tera/ttf/LexendTera-Regular.ttf "$pkgdir/usr/share/fonts/TTF/LexendTera-Regular.ttf"
  install -Dm644 $pkgname/fonts/zetta/ttf/LexendZetta-Regular.ttf "$pkgdir/usr/share/fonts/TTF/LexendZetta-Regular.ttf"
  install -Dm644 $pkgname/OFL.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
