# Contributor: Rik <rik at octave.org>
# Maintainer: Aaron Ali <t0nedef@causal.ca>
pkgname=vim-octave
pkgver=3.8.3
pkgrel=1
pkgdesc="m file syntax highlighting"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=3600"
license=('GPL')
depends=('vim')
source=(
	'octave.vim::http://www.vim.org/scripts/download_script.php?src_id=22437'
)
package() {
	install -Dm644 ${srcdir}/octave.vim ${pkgdir}/usr/share/vim/vim73/syntax/octave.vim
}
#
md5sums=('7c0122efd6ec226ae0fcb45ec92f5321')
