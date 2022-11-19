# Maintainer: hu3rror <hu3rror@protonmail.com>

pkgname=kitty-xterm-symlinks
pkgver=1
pkgrel=1
pkgdesc='Runs kitty if xterm is called'
arch=('any')
depends=('kitty')
provides=('xterm')
conflicts=('xterm' 'alacritty-xterm-symlink')

package() {
  install -dm755 "$pkgdir/usr/bin/"
  cd "$pkgdir/usr/bin/"
  ln -s kitty xterm 
}
