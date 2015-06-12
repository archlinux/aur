# Maintainer: Michael Schubert <mschu.dev at gmail>

pkgname=vim-wombat
pkgver=2.0
pkgrel=2
pkgdesc="Two versions of the 256-color Wombat scheme for vim"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=2465
     http://blog.echofish.org/?p=55"
license=('GPL')
depends=('vim')
source=(wombat256.vim::http://www.vim.org/scripts/download_script.php?src_id=13397
wombat256mod.vim::http://www.vim.org/scripts/download_script.php?src_id=13400)
md5sums=('7f6856cacb7ba2b7c2e725f6a306de4a'
         '06bcb1309b20c460dbcf175fcd3007c4')

package() {
  msg "To use, execute these commands or put them in your vimrc:"
  msg "  set t_Co=256"
  msg "  colorscheme wombat256.vim"

  install -Dm644 "$srcdir/wombat256.vim" \
    "$pkgdir/usr/share/vim/vim74/colors/wombat256.vim"
  install -Dm644 "$srcdir/wombat256mod.vim" \
    "$pkgdir/usr/share/vim/vim74/colors/wombat256mod.vim"
}

