# Maintainer: Ingo Bürk <admin at airblader dot de>
pkgname=vim-gruvbox-git
pkgver=latest
pkgrel=5
pkgdesc="gruvbox color scheme for vim"
arch=('any')
url="https://github.com/morhetz/gruvbox"
license=('MIT')
depends=('vim')
makedepends=('git')
groups=('vim-plugins')
source=("$pkgname::git+https://github.com/morhetz/gruvbox.git")
md5sums=('SKIP')

package() {
    install -Dm755 "${srcdir}/${pkgname}/colors/gruvbox.vim" "${pkgdir}/usr/share/vim/vimfiles/colors/gruvbox.vim"
    install -Dm755 "${srcdir}/${pkgname}/gruvbox_256palette.sh" "${pkgdir}/usr/share/vim/vimfiles/gruvbox_256palette.sh"
}
