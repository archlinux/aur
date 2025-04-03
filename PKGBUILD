# Maintainer: Alexey Makhmutov <makhmutov at gmail dot com>
pkgname=gnome-shell-extension-frippery-move-clock
pkgver=48.0
pkgrel=1
pkgdesc="GNOME extension that moves the clock from the centre of the panel towards the right. Part of GNOME Shell Frippery."
arch=("any")
url='http://frippery.org/extensions/index.html'
license=("GPL-2.0-or-later")
groups=("gnome-shell-extensions")
depends=("gnome-shell>=1:46")
conflicts=("gnome-shell-frippery")
options=("!strip" "!debug")
source=("http://frippery.org/extensions/gnome-shell-frippery-${pkgver}.tgz")
b2sums=("d5c3dd98861d98c0651baee88ec35446bb6406ddb157e8dd711b0e47dbc4504d85ab5334758e4c067903ee7d27e0c9b60f70cbb629d6034e94f4ad5f2ad41ddf")

_uuid="Move_Clock@rmy.pobox.com"

package() {
  cd .local
  install -D -t "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}" share/gnome-shell/extensions/${_uuid}/extension.js share/gnome-shell/extensions/${_uuid}/metadata.json
}
