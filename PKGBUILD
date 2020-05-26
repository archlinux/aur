# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname=vim-log-highlighting
pkgver=1.0
pkgrel=1
pkgdesc="Syntax highlighting for generic log files in VIM"
arch=(any)
url="https://github.com/MTDL9/vim-log-highlighting"
license=(MIT)
depends=(vim)
source=("$pkgname-$pkgver.zip::https://github.com/MTDL9/$pkgname/archive/master.zip")
sha256sums=('4bd22376c8bd02e1cd2cdef37206e39afda41fd0b6cb2c3eae5d2e389ea3ced3')

package() {
	#cd "$pkgname-$pkgver"
	cd "$pkgname-master"
	install -Dm644 ftdetect/log.vim "$pkgdir/usr/share/vim/vimfiles/ftdetect/log.vim"
	install -Dm644 syntax/log.vim "$pkgdir/usr/share/vim/vimfiles/syntax/log.vim"
}
