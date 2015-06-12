pkgname=vim-fakeclip
pkgver=0.2.10
_scriptid=17281
pkgrel=1
pkgdesc="Pseudo X11-clipboard / screen / tmux  register"
arch=('i686' 'x86_64')
url="http://www.vim.org/scripts/script.php?script_id=2098"
license=('MIT')
depends=('vim')
groups=('vim-plugins')
install=vimdoc.install
source=($pkgname.zip::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid})
md5sums=('c9ae69effaf8adada8b5db4b216e8072')

package() {
    cd "$srcdir"/$pkgname-$pkgver
    install -d "$pkgdir"/usr/share/vim/vim74/{doc,autoload,plugin}

    install -m644 doc/fakeclip.txt      "$pkgdir"/usr/share/vim/vim74/doc/
    install -m644 autoload/fakeclip.vim "$pkgdir"/usr/share/vim/vim74/autoload/
    install -m644 plugin/fakeclip.vim   "$pkgdir"/usr/share/vim/vim74/plugin/
}
