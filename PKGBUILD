# Maintainer: Alexey Makhmutov <makhmutov at gmail dot com>
pkgname=gnome-shell-extension-quick-lang-switch
pkgver=16
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
b2sums=("217f1418ff744a34cb4c4b70ebd1cf6bdb5f7b41437b02a36f7c3ce08cb847fc77a5e25ac34694927c0704ed815f588f7301ba88aed9716e7f955736f75e5600")

_uuid="quick-lang-switch@ankostis.gmail.com"

#prepare() {
#  cd gnome-shell-quick-lang-switch-$pkgver
#  patch -Np1 -i ../gnome-shell-quick-lang-switch-gnome49.patch
#}

package() {
  cd gnome-shell-quick-lang-switch-$pkgver

  install -D extension.js metadata.json -t "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
}
