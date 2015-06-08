# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname=vim-kolor
_pkgname=kolor
pkgver=1.4.1
pkgrel=1
pkgdesc="Vim color scheme with high text readability and optimal visibility of every element."
arch=('any')
url="https://github.com/zeis/vim-kolor"
license=('MIT')
depends=('vim')
source=("https://github.com/zeis/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('f297313538760ba23579d80c9f830f6e6c588189fbb6c03c89dbb95e1ee52aac')

package() {
	cd "$pkgname-$pkgver"
	install -Dm644 colors/$_pkgname.vim "$pkgdir/usr/share/vim/vimfiles/colors/$_pkgname.vim"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
