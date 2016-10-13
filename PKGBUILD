# Maintainer:  Joost Bremmer <toost.b@gmail.com>
# Contributor: Aaron Griffin <aaron@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=neovim-workspace
pkgver=1.0b1
_scriptid=4812
pkgrel=1
pkgdesc="Neovim workspace manager plugin for managing groups of files "
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=1410"
license=('unknown')
depends=('neovim')
makedepends=('unzip')
groups=('neovim-plugins')
install=nvim-doc.install
source=("$pkgname-pkgver.tar.gz::http://www.vim.org/scripts/download_script.php?src_id=$_scriptid")
sha256sums=('757b12ae378fae74f7d43dfdffc95111f0bc280a62e1ddf429cb3f302044db1f')

package() {
	cd ${srcdir}

	installpath="${pkgdir}/usr/share/nvim/runtime"

	install -D -m644 doc/workspace.txt \
	   $installpath/doc/workspace.txt
	install -D -m644 plugin/workspace.vim \
	   $installpath/plugin/workspace.vim
}
