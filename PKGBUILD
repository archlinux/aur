# Maintainer: Michael Herzberg <{firstname}@{firstinitial}{lastname}.de>

pkgname=vim-asyncrun-git
pkgver=r188.a81b997
pkgrel=1
pkgdesc='Run Async Shell Commands in Vim 8.0 / NeoVim and Output to Quickfix Window'
arch=('any')
license=('MIT')
url='https://github.com/skywind3000/asyncrun.vim'
depends=('vim')
makedepends=('git')
source=('git+https://github.com/skywind3000/asyncrun.vim')
md5sums=('SKIP')

pkgver() {
  cd asyncrun.vim
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd asyncrun.vim
  install -Dm644  plugin/asyncrun.vim "${pkgdir}/usr/share/vim/vimfiles/plugin/asyncrun.vim"
}
