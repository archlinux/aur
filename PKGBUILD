# Maintainer: Alexey Makhmutov <makhmutov at gmail dot com>
pkgname=gnome-shell-extension-quick-lang-switch
pkgver=17
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
b2sums=("26fb83628c083603578de809998dce12bad22d7c5f1b6ef80b6e89ad696ee3d22fa830afde0016cf4989ed006c4035d8ff27491e9fa8bae56ada6ae94a931ef4")

_uuid="quick-lang-switch@ankostis.gmail.com"

#prepare() {
#  cd gnome-shell-quick-lang-switch-$pkgver
#  patch -Np1 -i ../gnome-shell-quick-lang-switch-gnome50.patch
#}

package() {
  cd gnome-shell-quick-lang-switch-$pkgver

  install -D extension.js metadata.json -t "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
}
