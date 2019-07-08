# Maintainer: Sainnhe Park <sainnhe@gmail.com>
pkgname=vim-airline-forest-night-git
pkgver=v0.2.r11.g5a6a31e
pkgrel=1
pkgdesc="forest-night color scheme for vim-airline"
arch=('any')
url="https://github.com/sainnhe/vim-color-forest-night"
license=('MIT' 'Anti-996')
optdepends=('vim-colorscheme-forest-night-git' 'vim-airline-git')
makedepends=('git')
source=("git+https://github.com/sainnhe/vim-color-forest-night.git")
md5sums=('SKIP')
_pkgname=vim-color-forest-night

pkgver() {
  cd "$srcdir/$_pkgname"
    git describe --long --tags | sed 's/-/.r/;s/-/./' 
}

package() {
    install -Dm755 ${srcdir}/${_pkgname}/autoload/airline/themes/forest_night.vim ${pkgdir}/usr/share/vim/vimfiles/autoload/airline/themes/forest_night.vim
}
