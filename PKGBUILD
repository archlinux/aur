# Maintainer: Alexey Makhmutov <makhmutov at gmail dot com>
pkgname=gnome-shell-extension-quick-lang-switch
pkgver=12
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
b2sums=("3b57f1e8bb1211b6b0cc970f5451595d6696135d82883dbc88b1755690c1e3a2e2494985392fce6c2e7f1b07288e14cf7f25f2c7556adb240bfc7f02b0635102")

_uuid="quick-lang-switch@ankostis.gmail.com"

package() {
  cd gnome-shell-quick-lang-switch-$pkgver

  install -D extension.js metadata.json -t "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
}
