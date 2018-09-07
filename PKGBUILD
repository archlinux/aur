# Maintainer: Aaron Ali <t0nedef@causal.ca>
pkgname=vim-phpfolding
pkgver=2.1
pkgrel=1
pkgdesc="PHP folding plugin for vim written by Ray Burgemeestre"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=1623"
license=('GPL')
depends=('vim')
source=(
	'phpfolding.vim::https://www.vim.org/scripts/download_script.php?src_id=26122'
)
package() {
	install -Dm644 ${srcdir}/phpfolding.vim ${pkgdir}/usr/share/vim/vim81/ftplugin/php/phpfolding.vim
}
#
md5sums=('6792ff891b78ea5ba77e4ed3ac23bb5a')
