# Maintainer: Sahaj Bhatt <sahajb0606@gmail.com>
pkgname=scrntime-git
pkgver=1.4.1
pkgrel=1
pkgdesc="A CLI for displaying daily screentime with afk/idle time support"
arch=(x86_64)
url="https://github.com/sahaj-b/scrntime.git"
license=('BSD')
depends=('python')
makedepends=('git')
optdepends=('xprintidle: For detecting idle time on X11'
  'hypridle: For detecting idle time on Hyprland'
  'swayidle: For detecting idle time on Sway')
provides=('scrntime')
conflicts=('scrntime')
source=("git+$url")
sha256sums=('SKIP')

package() {
  cd "$srcdir/${pkgname%-git}"
  install -Dm755 scrntime.py "$pkgdir/usr/bin/scrntime"
}
