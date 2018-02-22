# Maintainer: Ankit R Gadiya <arch@argp.in>

pkgname=ranger-vim
pkgver=2.0
pkgrel=1
pkgdesc="Ranger integration for vim"
license=('MIT')
arch=('any')
url="https://github.com/francoiscabrol/ranger.vim"
depends=('vim' 'ranger')
groups=('vim-plugins')
source=("https://github.com/francoiscabrol/${pkgname/-/.}/archive/${pkgver}.tar.gz")
md5sums=('59f24462eb5c7561756a646585cd9e4c')

package() {
    install -Dm755 "${srcdir}/${pkgname/-/.}-${pkgver}/plugin/ranger.vim" \
		"${pkgdir}/usr/share/vim/vimfiles/plugin/ranger.vim"
}
