# Contributor: Rik <rik at octave.org>
# Maintainer: Aaron Ali <t0nedef@causal.ca>
pkgname=vim-octave
pkgver=4.2.0
pkgrel=1
pkgdesc="m file syntax highlighting"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=3600"
license=('GPL')
depends=('vim')
source=(
	'octave.vim::https://www.vim.org/scripts/download_script.php?src_id=24730'
)
package() {
	install -Dm644 ${srcdir}/octave.vim ${pkgdir}/usr/share/vim/vim81/syntax/octave.vim
}
#
md5sums=('73d03bf46db2837317a73349a57c23c0')
