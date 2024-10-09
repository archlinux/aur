# Maintainer: ReStranger

pkgname=xterm-alacritty-smooth-cursor-symlink
pkgver=1
pkgrel=1
pkgdesc="symlink to alacritty-smooth-cursor from xterm with fix for wayland, required by gtk-launch for terminal applications"
arch=("any")
license=('GPL')
depends=("alacritty-smooth-cursor-git")
provides=("xterm")
conflicts=("xterm")
source=("xterm")
sha256sums=("0412662abf533a4044e09196ff18918529d5cc4b4475ff00199c779acf92cecc")

package() {
    mkdir -p "$pkgdir"/usr/bin
    install -Dm777 "$srcdir"/xterm \
      "$pkgdir"/usr/bin/xterm
}
