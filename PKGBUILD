# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname=vim-kolor
_pkgname=kolor
pkgver=1.4.2
pkgrel=1
pkgdesc="Vim color scheme with high text readability and optimal visibility of every element."
arch=('any')
url="https://github.com/zeis/vim-kolor"
license=('MIT')
depends=('vim')
source=("https://github.com/zeis/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('7f54f37a38a7f20895b611dfe505d0c31010653d9c6b76ded3fa65af688bb85c')

package() {
	cd "$pkgname-$pkgver"
	install -Dm644 colors/$_pkgname.vim "$pkgdir/usr/share/vim/vimfiles/colors/$_pkgname.vim"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
