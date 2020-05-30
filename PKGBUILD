# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=vim-wombat
pkgver=2.0
pkgrel=5
pkgdesc="Two versions of the 256-color Wombat scheme for vim"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=2465"
license=('GPL')
depends=('vim>=8.2' 'vim<8.3')
source=(wombat256.vim::http://www.vim.org/scripts/download_script.php?src_id=13397
        wombat256mod.vim::http://www.vim.org/scripts/download_script.php?src_id=13400)
sha256sums=('a190994cab7eb771e57560110236740cb26d741381d5f27b9e695d8d576f47f9'
            '56fb9a268b0922e31e896703c5560ce1d2cfa02d8c876c2164a63a9d9e0456e9')

package() {
  msg "To use, execute these commands or put them in your vimrc:"
  msg "  set t_Co=256"
  msg "  colorscheme wombat256.vim"

  install -Dm644 "$srcdir/wombat256.vim" \
    "$pkgdir/usr/share/vim/vim82/colors/wombat256.vim"
  install -Dm644 "$srcdir/wombat256mod.vim" \
    "$pkgdir/usr/share/vim/vim82/colors/wombat256mod.vim"
}
