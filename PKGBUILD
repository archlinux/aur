# Maintainer: Aaron Ali <t0nedef@causal.ca>
pkgname=vim-phpfolding
pkgver=1.9
pkgrel=1
pkgdesc="PHP folding plugin for vim written by Ray Burgemeestre"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=1623"
license=('GPL')
depends=('vim')
source=(
	'phpfolding.vim::http://www.vim.org/scripts/download_script.php?src_id=21976'
)
package() {
	install -Dm644 ${srcdir}/phpfolding.vim ${pkgdir}/usr/share/vim/vim74/ftplugin/php/phpfolding.vim
}
#
md5sums=('1ab2e18b3f6fb0ef19a98447044b8557')
