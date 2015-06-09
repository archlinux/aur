# Maintainer: Marcel Korpel <marcel[dot]korpel[at]gmail>
# Contributor: Tammer Ibrahim <t at tammeri dot net>

pkgname=ttf-courier-prime
pkgver=1.203
pkgrel=1
pkgdesc="Monospace Courier font alternative optimized for screenplays"
arch=('any')
url='http://quoteunquoteapps.com/courierprime/'
license=('custom')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=$pkgname.install
source=('http://quoteunquoteapps.com/downloads/courier-prime.zip')
sha256sums=('d5d4faf1bee0d1f52bab1103cbfdfb354976331c86f999c110c22a098cb12d73')

package() {
  cd "$srcdir/Courier Prime"
  install -d "$pkgdir/usr/share/fonts/TTF"
  install -m644 *.ttf "$pkgdir/usr/share/fonts/TTF"
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 LICENSE/* "$pkgdir/usr/share/licenses/$pkgname"
}
