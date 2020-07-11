# Maintainer: David Wang <tuxsavvy-noms at yahoo dot com dot au>

pkgname=ttf-ricty-diminished
pkgver=4.1.1
pkgrel=1
pkgdesc='Japanese TrueType font for developers by mixing Inconsolata and Circle M+ 1m.'
arch=('any')
url='https://rictyfonts.github.io/diminished'
license=('custom:OFL')
depends=('fontforge')
source=('https://rictyfonts.github.io/files/ricty_diminished-4.1.1.tar.gz')
sha256sums=('09d6cf8eaf3402205dd8a0fa35469d41833b4e85bedddfac235255d78747766b')

package() {
  cd "$srcdir"
  install -d "$pkgdir/usr/share/fonts/TTF"
  install -m644 *.ttf "$pkgdir/usr/share/fonts/TTF/"
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 OFL.txt "$pkgdir/usr/share/licenses/$pkgname/"
}
