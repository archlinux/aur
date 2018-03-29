# Maintainer: Rohit Goswami (HaoZeke) <rohit.goswami@aol.com>

pkgname=ttf-neuton
pkgver=01git
pkgrel=1
pkgdesc="Neuton is a clean, dark, somewhat Dutch-inspired serif font which reminds you a little of Times."
url="https://fonts.google.com/download?family=Neuton"
arch=(any)
license=('custom:SIL Open Font License')
makedepends=('unzip')
provides=('ttf-neuton')
source=("$url")
sha256sums=('SKIP')

package() {
  install -d "$pkgdir/usr/share/fonts/${pkgname%-fonts}"
  install -t "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 *.ttf
  install -Dm644 OFL.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
