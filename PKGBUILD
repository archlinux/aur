# Maintainer: Alexey Makhmutov <makhmutov at gmail dot com>
pkgname=gnome-shell-extension-frippery-move-clock
pkgver=51.0
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
b2sums=("fb096e0fd55ba7109327a9a59cc6ec79d4b5e7e25219f60b2bb88d86e50e05eff27aeafd41bc03b388b03cb188d0983ce86f8f70fc8afd66921960fcb69aac3b")

_uuid="Move_Clock@rmy.pobox.com"

package() {
  cd .local
  install -D -t "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}" share/gnome-shell/extensions/${_uuid}/extension.js share/gnome-shell/extensions/${_uuid}/metadata.json
}
