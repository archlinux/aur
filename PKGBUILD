# Maintainer: Alexey Makhmutov <makhmutov at gmail dot com>
pkgname=gnome-shell-extension-quick-lang-switch
pkgver=15
pkgrel=1
pkgdesc="Quickly switch keyboard language layout without showing the switcher popup."
arch=("any")
url="https://github.com/ankostis/gnome-shell-quick-lang-switch"
license=("AGPL-3.0-or-later")
groups=("gnome-shell-extensions")
depends=("gnome-shell>=1:45")
options=("!strip" "!debug")
_commit=af1aa83dddece116eae8a382459b16016ad9b55c
source=("src-$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=("eaf5f66e477a08707ee91fd6c43fbc8511ce8d7f9967a0d28cd55d700d59dd7bc251c1f198fd9a7e34449ff4bf81ce01d9389c2bbc9fbc6e292146ce67eeffd6")

_uuid="quick-lang-switch@ankostis.gmail.com"

package() {
  cd gnome-shell-quick-lang-switch-$pkgver

  install -D extension.js metadata.json -t "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
}
