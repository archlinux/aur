# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname=vim-log-highlighting
pkgver=1.0.0
pkgrel=1
pkgdesc="Syntax highlighting for generic log files in VIM"
arch=(any)
url="https://github.com/MTDL9/vim-log-highlighting"
license=(MIT)
depends=(vim)
source=("$pkgname-$pkgver.tar.gz::https://github.com/MTDL9/$pkgname/archive/v$pkgver.tar.gz")
b2sums=('f93e66e827eef20e7d941503826a576b0699c3e59bc1d818782f83cd060b49d0bed2fbdf31359d063e3c5ae6f2355639ee05a331d96ce4ba5fef80749c83fbca')

package() {
	cd "$pkgname-$pkgver"
	install -Dm644 ftdetect/log.vim "$pkgdir/usr/share/vim/vimfiles/ftdetect/log.vim"
	install -Dm644 syntax/log.vim "$pkgdir/usr/share/vim/vimfiles/syntax/log.vim"
}
