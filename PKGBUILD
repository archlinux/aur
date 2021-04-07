# Maintainer: jesuschroist <chris@qlab.pro>

pkgname=ttf-maximilian
pkgver=1.0
pkgrel=2
pkgdesc="Maximilian geschaffen 1914 von Rudolf Koch. Digitalisiert durch Dieter Steffmann, Kreuztal."
arch=('any')
url="http://www.steffmann.de/"
license=('custom:FFC')
source=(https://www.1001fonts.com/download/maximilian.zip)
md5sums=('5c772d58c0259b5db29d63da46d54805')

package() {
  cd "$srcdir"
  install -dm755 "$pkgdir/usr/share/fonts/TTF"
  install -Dm644 Maximilian.ttf "$pkgdir/usr/share/fonts/TTF"
  install -Dm644 MaximilianZierbuchstaben.ttf "$pkgdir/usr/share/fonts/TTF"
  install -Dm644 1001fonts-maximilian-eula.txt "$pkgdir/usr/share/licenses/$pkgname"
}
