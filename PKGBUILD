#Maintainter: Joost Bremmer <toost.b@gmail.com>
#Contributor: Aaron Griffin <aaron@archlinux.org>

pkgname=neovim-buffexplorer
pkgver=7.4.6
pkgrel=1
pkgdesc="A simple buffer list/switcher for Neovim"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=42"
license=('BSD')
depends=('neovim')
makedepends=('git')
groups=('neovim-plugins')
install=nvim-doc.install
source=("$pkgname::git://github.com/jlanzarotta/bufexplorer.git#commit=fc022c")
md5sums=('SKIP')

package() {
	cd ${srcdir}/$pkgname

	installpath="${pkgdir}/usr/share/nvim/runtime"

	install -D -m644 doc/bufexplorer.txt $installpath/doc/bufexplorer.txt
	install -D -m644 plugin/bufexplorer.vim $installpath/plugin/bufexplorer.vim
	install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
