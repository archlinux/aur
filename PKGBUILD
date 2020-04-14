# Maintainer: Khaled Emara <mail@KhaledEmara.dev>

pkgname=ttf-markazi-text-variable
pkgver=1.000
pkgrel=1
pkgdesc="An Arabic typeface serif font by Borna Izadpanah"
url="https://fonts.google.com/specimen/Markazi+Text"
arch=(any)
license=(OFL)
source=('https://fonts.google.com/download?family=Markazi%20Text')
sha512sums=('SKIP')

package() {
  install -Dm644 -t "$pkgdir/usr/share/fonts/OTF" MarkaziText-VariableFont_wght.ttf
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt
}
