# Maintainer: Sainnhe Park <sainnhe@gmail.com>
pkgname=vim-lightline-forest-night-git
pkgver=v0.2.r6.g349baee
pkgrel=1
pkgdesc="forest-night color scheme for vim-lightline"
arch=('any')
url="https://github.com/sainnhe/vim-color-forest-night"
license=('MIT', 'Anti-996')
optdepends=('vim-colorscheme-forest-night-git')
makedepends=('git')
source=("git+https://github.com/sainnhe/vim-color-forest-night.git")
md5sums=('SKIP')
_pkgname=vim-color-forest-night

pkgver() {
  cd "$srcdir/$_pkgname"
    git describe --long --tags | sed 's/-/.r/;s/-/./' 
}

package() {
    install -Dm755 ${srcdir}/${_pkgname}/autoload/lightline/colorscheme/forest_night.vim ${pkgdir}/usr/share/vim/vimfiles/autoload/lightline/colorscheme/forest_night.vim
}
