# Maintainer: Ingo Bürk <admin at airblader dot de>
pkgname=vim-airline-gruvbox-git
pkgver=latest
pkgrel=4
pkgdesc="gruvbox color scheme for vim-airline"
arch=('any')
url="https://github.com/morhetz/gruvbox"
license=('MIT')
depends=('vim' 'vim-airline')
optdepends=('vim-gruvbox-git')
makedepends=('git')
groups=('vim-plugins')
source=("$pkgname::git+https://github.com/morhetz/gruvbox.git")
md5sums=('SKIP')

package() {
    install -Dm755 ${srcdir}/${pkgname}/autoload/airline/themes/gruvbox.vim ${pkgdir}/usr/share/vim/vimfiles/autoload/airline/themes/gruvbox.vim
}
