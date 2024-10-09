# Maintainer: ReStranger

pkgname=xterm-alacritty-smooth-cursor-symlink
pkgver=1
pkgrel=1
pkgdesc="symlink to alacritty-smooth-cursor from xterm with fix for wayland, required by gtk-launch for terminal applications"
arch=("any")
license=('GPL')
depends=("alacritty")
provides=("xterm")
conflicts=("xterm")

package() {
    mkdir -p "$pkgdir"/usr/bin
    install -Dm644 "$srcdir"/xterm \
      "$pkgdir"/usr/bin/xterm
}
