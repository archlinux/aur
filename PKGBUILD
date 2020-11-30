# Author: Maxime “pep” Buquet <archlinux@bouah.net>

_pkgbase=karla
pkgname=ttf-karla
pkgver=20160111
pkgrel=1
pkgdesc="Grotesque Sans Serif Latin typeface"
arch=('any')
license=('custom:OFL')
url=https://gitlab.collabora.com/collabora/fonts-karla
source=("$_pkgbase::git+https://gitlab.collabora.com/collabora/fonts-karla.git#tag=upstream/${pkgver}")
sha512sums=('SKIP')

package() {
  cd "$srcdir/$_pkgbase"

  install -dm755 "$pkgdir/usr/share/fonts/TTF"
  install -m644 Karla-{Bold,BoldItalic,Italic,Regular}.ttf "$pkgdir/usr/share/fonts/TTF"
  install -D -m644 OFL.txt "$pkgdir/usr/share/licenses/ttf-karla/LICENSE"
}
