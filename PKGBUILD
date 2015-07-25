# Maintainer: Felipe Morales <hel.sheep@gmail.com>
pkgname=neovim-gnome-terminal-wrapper
pkgver=1
pkgrel=1
pkgdesc="A wrapper for running neovim in a separate instance of gnome-terminal"
arch=(any)
url="http://github.com/fmoralesc/"
license=('GPL')
groups=()
depends=('python-dbus' 'neovim-git' 'gnome-terminal') 
source=(neovim.desktop nvim-wrapper neovim.svg)
md5sums=('9833885822ad32f62eec455fd60a5fe1' '345fa48dcf47a6143034f2b1deed20d1' '2b271742492f200bcac78dbfe33caa3c')


package() {
  cd "$srcdir/"
  install -Dm755 nvim-wrapper "$pkgdir/usr/bin/nvim-wrapper"
  install -Dm644 neovim.desktop "$pkgdir/usr/share/applications/neovim.desktop"
  install -Dm644 neovim.svg "$pkgdir/usr/share/icons/neovim.svg"
}

# vim:set ts=2 sw=2 et:
