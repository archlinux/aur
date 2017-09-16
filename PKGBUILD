# Maintainer: yesuu zhang <yesuu79@qq.com>

pkgname=vim-gocode
pkgver=20170907
pkgrel=1
pkgdesc="An autocompletion daemon for the Go programming language (vim scripts)"
arch=('any')
url="https://github.com/nsf/gocode"
license=('MIT')
depends=('vim>=7.0' 'gocode-daemon')
source=('https://github.com/nsf/gocode/archive/v.20170907.tar.gz')
sha256sums=('100dbf8a971b10728b7566d430d368a62e60c77b880be96dc0b6364364cac2b4')

package() {
	cd "${srcdir}/gocode-v.20170907/vim"
	install --directory "${pkgdir}/usr/share/vim/vimfiles"
	cp -r autoload "${pkgdir}/usr/share/vim/vimfiles"
	cp -r ftplugin "${pkgdir}/usr/share/vim/vimfiles"
}
