# Maintainer: reedts <j.reedts at gmail dot com>
pkgname=vim-nord-git
pkgver=r51.05d536f
pkgrel=1
epoch=
pkgdesc="A arctic, north-bluish clean and elegant Vim theme."
arch=('any')
url="https://github.com/arcticicestudio/nord-vim"
license=('Apache')
groups=('vim-plugins')
depends=('vim')
makedepends=('git')
optdepends=()
checkdepends=()
conflicts=()
provides=('vim-nord-git')
replaces=()
backup=()
options=()
changelog=
source=("$pkgname::git+https://github.com/arcticicestudio/nord-vim.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm644 colors/nord.vim $pkgdir/usr/share/vim/vimfiles/colors/nord.vim
}

