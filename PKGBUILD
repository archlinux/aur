# Maintainer:  <zhaose@empty-PC>
pkgname=oldschool-pc-font-ttf
pkgver=2.2
pkgrel=1
epoch=
pkgdesc="Classic fonts from oldschool pc fonts"
arch=('any')
url="https://int10h.org/oldschool-pc-fonts/"
license=('Attribution-ShareAlike 4.0')
source=("https://int10h.org/oldschool-pc-fonts/download/oldschool_pc_font_pack_v${pkgver}_linux.zip")
md5sums=('e4e114151d7d9d4baf7b0f69b6645043')

package() {
  cd "$srcdir/"
  install -d $pkgdir/usr/share/fonts/oldschool/

  install -D ttf\ -\ Mx\ \(mixed\ outline+bitmap\)/* "$pkgdir/usr/share/fonts/oldschool/"
}

# vim:set ts=2 sw=2 et:
