# Maintainer: Alexey Makhmutov <makhmutov at gmail dot com>
pkgname=gnome-shell-extension-frippery-move-clock
pkgver=50.0
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
b2sums=("692f8006af818284695911de2b884a21aba0ae176ba9d7ea608ca8734fd22c557efae11d2d58e373f8ae010070fc796dfd9acb2e213941c74d052ff11bc52601")

_uuid="Move_Clock@rmy.pobox.com"

#prepare() {
#  cd .local
#  patch -Np1 -i ../frippery-move-clock-gnome50.patch
#}

package() {
  cd .local
  install -D -t "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}" share/gnome-shell/extensions/${_uuid}/extension.js share/gnome-shell/extensions/${_uuid}/metadata.json
}
