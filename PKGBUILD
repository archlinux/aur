# Maintainer: Johannes Schlatow <johannes.schlatow@googlemail.com>

pkgname=vim-stabs
pkgver=1.2
pkgrel=1
pkgdesc="A vim plugin to use tabs for indentation and spaces for alignment"
arch=('any')
url="https://github.com/Thyrum/vim-stabs"
license=('GPLv3')
depends=('vim')
groups=('vim-plugins')
install=vimdoc.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/Thyrum/vim-stabs/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('417b0b108465ce5b9095151d3fdde31758a5ddfd50d3899c25420ad9ac4b1cc0')

package() {
	cd ${srcdir}/vim-stabs-1.2

	installpath="${pkgdir}/usr/share/vim/vimfiles"

	install -Dm644 doc/stabs.txt    $installpath/doc/stabs.txt
	install -Dm644 plugin/stabs.vim $installpath/plugin/stabs.vim
	install -Dm644 LICENSE          ${pkgdir}/usr/share/licenses/vim-stabs/LICENSE
}
