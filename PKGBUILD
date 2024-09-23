# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
# Contributor: Maxime “pep” Buquet <archlinux@bouah.net>

# There is no versioning in-repo, although there is some upon import into the
# lerger repo https://github.com/google/fonts. For example:
# https://github.com/google/fonts/commit/568985dba2cc5bf58d9f59af93fd5a5faea610ff

_pkgbase=karla
_commit=69b25f663101efb4113dd7ed416c120dd2dce56a
pkgname=ttf-karla
pkgver=2.004
pkgrel=1
epoch=1
pkgdesc="Grotesque Sans Serif Latin typeface"
arch=('any')
license=('OFL-1.1')
url=https://fonts.google.com/specimen/Karla
source=("$_pkgbase-$_commit.tar.gz::https://github.com/googlefonts/karla/archive/$_commit.tar.gz")
sha512sums=('91127b03651671e9479c4a48513451bf4d72e1695a0c565db46cce38034d5cf03307db72744683473030ec585525ef58593af6f9f3f2a9b710d96334f4419a2d')
provides=(ttf-font)

package() {
  cd "$srcdir/$_pkgbase-$_commit"

  install -dm755 "$pkgdir/usr/share/fonts/TTF"
  install -m644 fonts/ttf/Karla-*.ttf "$pkgdir/usr/share/fonts/TTF"
}
