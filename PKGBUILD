# Maintainer: Johannes Schlatow <johannes.schlatow@googlemail.com>

pkgname=vim-openbrowser
pkgver=2.0.0
_scriptid=25873
pkgrel=1
pkgdesc="Open URI with your favorite browser from vim"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=3133"
license=('unknown')
depends=('vim')
makedepends=('unzip')
groups=('vim-plugins')
install=vimdoc.install
source=("$pkgname-$pkgver.zip::http://www.vim.org/scripts/download_script.php?src_id=$_scriptid")
sha256sums=('2abeca5d1f5b9a5fa018893197dc2e354b54cfc837b035ba6247f2c6dc37411c')

package() {
	cd ${srcdir}

	installpath="${pkgdir}/usr/share/vim/vimfiles"

	install -d doc/ $installpath/doc/
	install -d plugin/ $installpath/plugin/
	install -d autoload/ $installpath/autoload/
	install -d lang/ $installpath/lang/
}
