# Maintainer: Maxwell Pray <synthead@gmail.com>

_pkgname=vim-local-history
pkgname=$_pkgname-git
pkgver=r4.db671dc
pkgrel=1
pkgdesc="Use viminfo file relative to current working directory."
arch=("any")
url="https://github.com/maxboisvert/vim-local-history"
license=("GPL3")
source=("git+https://github.com/maxboisvert/vim-local-history.git")
md5sums=("SKIP")

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -Dm 644 "$srcdir/$_pkgname/plugin/vim-local-history.vim" "$pkgdir/usr/share/vim/vimfiles/plugin/vim-local-history.vim"
}
