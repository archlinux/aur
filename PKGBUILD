# Maintainer: Felipe Morales <hel.sheep@gmail.com>
pkgname=neovim-gnome-terminal-wrapper
pkgver=2
pkgrel=12
pkgdesc="A wrapper for running neovim in a separate instance of gnome-terminal"
arch=(any)
url="http://github.com/fmoralesc/"
license=('GPL')
groups=()
depends=('python-dbus' 'neovim' 'gnome-terminal')
source=('neovim.desktop'
        'nvim-wrapper'
        'neovim.svg')
md5sums=('c5b9b5db24db814376b6925ce0f9ad52'
         'afc12c8bb06cbfda3c174ed3e994501d'
         '2b271742492f200bcac78dbfe33caa3c')

package() {
  cd "$srcdir/"
  install -Dm755 nvim-wrapper "$pkgdir/usr/bin/nvim-wrapper"
  install -Dm644 neovim.desktop "$pkgdir/usr/share/applications/neovim.desktop"
  install -Dm644 neovim.svg "$pkgdir/usr/share/icons/neovim.svg"
}

# vim:set ts=2 sw=2 et:
