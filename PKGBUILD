# Maintainer: reedts <j.reedts at gmail dot com>
pkgname=vim-airline-nord-git
pkgver=r51.05d536f
pkgrel=1
epoch=
pkgdesc="A arctic, north-bluish clean and elegant Vim airline theme."
arch=('any')
url="https://github.com/arcticicestudio/nord-vim"
license=('Apache')
groups=('vim-plugins')
depends=('vim' 'vim-airline')
makedepends=('git')
optdepends=()
checkdepends=()
conflicts=()
provides=('vim-airline-nord-git')
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
  install -Dm644 autoload/airline/themes/nord.vim $pkgdir/usr/share/vim/vimfiles/autoload/airline/themes/nord.vim
}

