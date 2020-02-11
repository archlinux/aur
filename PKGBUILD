# Maintainer: Vlad Petrov <ejiek at mail dot ru>
_pkgname=gruvbox
pkgname=vim-${_pkgname}-community
pkgver=2.1.0
pkgrel=3
pkgdesc="gruvbox color scheme for vim"
arch=('any')
url="https://github.com/gruvbox-community/gruvbox"
license=('MIT')
depends=('vim')
groups=('vim-plugins')
provides=('vim-gruvbox')
conflicts=('vim-gruvbox')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/gruvbox-community/gruvbox/archive/v${pkgver}.tar.gz")
sha256sums=('1f6d64c61c9474bc4be548f57ae0f261ea1ad410c91aab417b069fa53bf5aa37')

package() {
    cd ${_pkgname}-${pkgver}
    install -Dm755 "colors/gruvbox.vim" "${pkgdir}/usr/share/vim/vimfiles/colors/gruvbox.vim"
    install -Dm755 "gruvbox_256palette.sh" "${pkgdir}/usr/share/vim/vimfiles/gruvbox_256palette.sh"
}
