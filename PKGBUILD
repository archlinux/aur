# Maintainer: Sainnhe Park <sainnhe@gmail.com>
pkgname=vim-airline-forest-night-git
pkgver=v0.1.0.r7.g5d964ff
pkgrel=1
pkgdesc="forest-night color scheme for vim-airline"
arch=('any')
url="https://github.com/sainnhe/forest-night"
license=('MIT')
depends=('vim')
optdepends=('vim-colorscheme-forest-night-git' 'vim-airline-git')
makedepends=('git')
source=("git+https://github.com/sainnhe/forest-night.git")
md5sums=('SKIP')
_pkgname=forest-night

pkgver() {
  cd "$srcdir/$_pkgname"
    git describe --long --tags | sed 's/-/.r/;s/-/./' 
}

package() {
    install -Dm755 ${srcdir}/${_pkgname}/autoload/airline/themes/forest_night.vim ${pkgdir}/usr/share/vim/vimfiles/autoload/airline/themes/forest_night.vim
}
