# Author: Maxime “pep” Buquet <archlinux@bouah.net>

_pkgbase=karla
pkgname=ttf-karla
pkgver=0_20140620
pkgrel=1
pkgdesc="Grotesque Sans Serif Latin typeface"
arch=('any')
license=('custom:OFL')
url='https://gitlab.collabora.com/collabora/fonts-karla'
depends=('fontconfig' 'xorg-font-utils')
_tag='upstream/0_20140620'
source=("$_pkgbase::git+https://gitlab.collabora.com/collabora/fonts-karla.git#tag=${_tag}")
sha512sums=('SKIP')

package() {
  cd "$srcdir/$_pkgbase"

  install -dm755 "$pkgdir/usr/share/fonts/TTF"
  install -m644 Karla-{Bold,BoldItalic,Italic,Regular}.ttf "$pkgdir/usr/share/fonts/TTF"
  install -D -m644 OFL.txt "$pkgdir/usr/share/licenses/ttf-karla/LICENSE"
}
