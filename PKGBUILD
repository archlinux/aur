# $Id$
# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname=font-christmas-mansgreback
pkgver=1.00
_relver=1.00
pkgrel=1
pkgdesc="Merry Christmas - Fonts by Måns Grebäck. PERSONAL USE ONLY. (Use the characters *#+ and the numbers to make stars, flakes and Christmas symbols; Example: *Merry0Christmas+) - Flakes and Stars"
url="http://mn.sg/merry-christmas"
arch=(any)
license=(custom)
source=("merry_christmas.zip::https://dl.dafont.com/dl/?f=merry_christmas")
sha256sums=('db70da52230e986d94dbfe8b002fab67680482d5e4e0c1fc2d44e069905ea4e9')

package() {
  cd $srcdir/
  install -d "$pkgdir/usr/share/fonts/${pkgname%-fonts}"
  install -t "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 *.ttf
  install -Dm644 "License - READ THIS.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
