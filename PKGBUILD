# Maintainer: Nagy Roland <roliboy@protonmail>
# Contributor: Andrea Feletto <andrea@andreafeletto.com>

pkgname=neovim-visual-multi
_pkgname=vim-visual-multi
pkgver=0.5.8
pkgrel=1
pkgdesc='Multiple cursors plugin for neovim'
arch=('any')
url='https://github.com/mg979/vim-visual-multi'
license=('MIT')
depends=('neovim')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('6fe2345306c751ab9f84ff5f99ba77a79d0db391d38992904b40f0abc538dbc7')

package() {
	local _installpath="${pkgdir}/usr/share/nvim/runtime"

	cd "${srcdir}/${_pkgname}-${pkgver}"
	install -dv "${_installpath}"
	cp -R autoload doc plugin "${_installpath}/"
}
