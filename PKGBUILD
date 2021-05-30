
# Maintainer: Neven Miculinic <neven.miculinic@gmail.com>

depends=('glibc' 'pacman' 'yay')
pkgname=pkgctrl-bin
pkgdesc="reconcile packages installed on Arch Linux system"
pkgver=0.1.0
pkgrel=1
arch=('x86_64')
url="https://github.com/nmiculinic/pkgctrl"
license=('Apache')
provides=('pkgctrl')
conflicts=('pkgctrl')
_binary=pkgctrl-linux-amd64
source=("$_binary-$pkgver::https://github.com/nmiculinic/pkgctrl/releases/download/v$pkgver/$_binary")
sha256sums=('76185995fc6fa589e1c32cc3ac915be68c32632b376b7c5da8fc6ef55f52a379')

package() {
  install -Dm 755 "$srcdir/$_binary-$pkgver" "$pkgdir/usr/bin/pkgctrl"
}
