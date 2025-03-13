# Maintainer: ReStranger

pkgname=xterm-alacritty-smooth-cursor-symlink
pkgver=1
pkgrel=2
pkgdesc="symlink to alacritty-smooth-cursor from xterm with fix for wayland, required by gtk-launch for terminal applications"
arch=("any")
license=('GPL')
depends=("alacritty-smooth-cursor-git")
provides=("xterm")
conflicts=("xterm")
source=("xterm")
sha256sums=("ba9ec35834b73ab2ed6f86bab0091ff0f6cf54070d7b94af62693e9ce4cb6b92")

package() {
    mkdir -p "$pkgdir"/usr/bin
    install -Dm777 "$srcdir"/xterm \
      "$pkgdir"/usr/bin/xterm
}
