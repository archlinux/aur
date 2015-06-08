# Maintainer: Br Anthony VanBerkum <anthonyvbop AT gmail DOT com>
pkgname=editorconfig-vim
pkgver=0.3.2
pkgrel=1
pkgdesc="EditorConfig plugin for Vim - editorconfig.org"
arch=("any")
url="https://github.com/editorconfig/editorconfig-vim"
license=("custom")
groups=("vim-plugins")
depends=("vim")
install=vimdoc.install
source=("https://github.com/editorconfig/editorconfig-vim/archive/v0.3.2.tar.gz")
sha256sums=("841661603c94cb0e259734576b5eca3d21692ff5543a25d83526a16d3a65d4a3")

package() {
  mkdir -p $pkgdir/usr/share/vim/vimfiles/{plugin,doc,autoload}
  cd "$srcdir/$pkgname-$pkgver"
  cp -r plugin/* $pkgdir/usr/share/vim/vimfiles/plugin/
  cp doc/editorconfig.txt $pkgdir/usr/share/vim/vimfiles/doc/
  cp autoload/editorconfig.vim $pkgdir/usr/share/vim/vimfiles/autoload/
  mkdir -p $pkgdir/usr/share/licenses/editorconfig-vim
  cp LICENSE $pkgdir/usr/share/licenses/editorconfig-vim
}
