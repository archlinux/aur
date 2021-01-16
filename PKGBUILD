# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname=vim-log-highlighting
pkgver=1.0.0.a
_commit=1037e26f3120e6a6a2c0c33b14a84336dee2a78f
pkgrel=1
pkgdesc="Syntax highlighting for generic log files in VIM"
arch=(any)
url="https://github.com/MTDL9/vim-log-highlighting"
license=(MIT)
depends=(vim)
source=("$pkgname-$_pkgver.tar.gz::https://github.com/MTDL9/vim-log-highlighting/archive/${_commit}.tar.gz")

package() {
  cd "$pkgname-$_commit"
	install -Dm644 ftdetect/log.vim "$pkgdir/usr/share/vim/vimfiles/ftdetect/log.vim"
	install -Dm644 syntax/log.vim "$pkgdir/usr/share/vim/vimfiles/syntax/log.vim"
}
b2sums=('7af7a27966302da73eacce55ccbbffaa1a5be20e68812a0969f522055001125a0729648526ddb155b140889ac0c7882b739e84969d1cea5544a68a820d609955')
