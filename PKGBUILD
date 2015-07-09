# Maintainer: oozyslug <oozyslug at gmail dot com>
# Contributor: oozyslug <oozyslug at gmail dot com>

pkgname=vim-pathogen-git
pkgver=2.3.10.g91e6378
pkgrel=2
pkgdesc="A vim plugin for managing your runtimepath"
arch=('any')
url="http://github.com/tpope/vim-pathogen"
license=('GPL')
groups=('vim-plugins')
depends=('vim')
makedepends=('git')
conflicts=('vim-pathogen')
provides=('vim-pathogen')
install=vimdoc.install
source=("git://github.com/tpope/vim-pathogen.git")
sha1sums=('SKIP')

pkgver() {
  cd vim-pathogen
  git describe | sed 's/^v//;s/-/./g'
}

package() {
  cd vim-pathogen
  install -Dm755 autoload/pathogen.vim "$pkgdir"/usr/share/vim/vimfiles/autoload/pathogen.vim
}

