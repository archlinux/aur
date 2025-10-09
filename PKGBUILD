# Maintainer: Alexey Makhmutov <makhmutov at gmail dot com>
pkgname=gnome-shell-extension-frippery-move-clock
pkgver=49.0
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
b2sums=("780f02e02da49f510beb651aedb85b64540e880348749b292ae0e008e3e43162cd2941608e12cab66366ec29d594cae19a9cf78ff19ab720aad07490bdd253f5")

_uuid="Move_Clock@rmy.pobox.com"

package() {
  cd .local
  install -D -t "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}" share/gnome-shell/extensions/${_uuid}/extension.js share/gnome-shell/extensions/${_uuid}/metadata.json
}
