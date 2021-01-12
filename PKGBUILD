# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=ttf-european-typewriter
pkgver=2001
pkgrel=1
pkgdesc="Monospace font with serifes"
arch=('any')
url='https://www.1001freefonts.com/de/d/9708/european-typewriter'
source=("$pkgname-$pkgver.zip::https://www.1001freefonts.com/de/d/9708/european-typewriter.zip")
sha256sums=('afd6aafa4727e59863a7e2fd9205a132436257bf445f34dd47ce374d4231c589')
license=('custom:unknown')

package() {
  install -d "$pkgdir"/usr/share/fonts/TTF
  install -Dm644 "$srcdir"/EuropeanTypewriter.ttf "$pkgdir"/usr/share/fonts/TTF/${pkgname#ttf-}.ttf 
 }

