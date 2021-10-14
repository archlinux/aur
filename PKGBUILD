# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: revel <revelΘmuub·net>

pkgname=vim-endwise
pkgver=1.2
pkgrel=4
pkgdesc='Vim plugin for ending structures automatically in Ruby'
arch=('any')
url='https://github.com/tpope/vim-endwise'
license=('custom:vim')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
makedepends=('git')
source=("$pkgname::git+$url#tag=v$pkgver?signed"
        'license.txt')
sha256sums=('SKIP'
            '5f96d0bf57942212b6117ac4e6eb9b6ad704c1758511333dd5785cedf3281b8d')
validpgpkeys=('881804A5DA541152FA12C105E09E474A404A3A45')

package() {
	install -Dm 644 license.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	cd "$pkgname"
	install -Dm 644 plugin/endwise.vim -t "$pkgdir/usr/share/vim/vimfiles/plugin/"
}
