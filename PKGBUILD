# Maintainer: yesuu zhang <yesuu79@qq.com>

pkgname=vim-gocode
pkgver=20150303
pkgrel=2
pkgdesc="An autocompletion daemon for the Go programming language (vim scripts)"
arch=('any')
url="https://github.com/nsf/gocode"
license=('MIT')
depends=('vim>=7.0' 'gocode-daemon')
source=('https://github.com/nsf/gocode/archive/v.20150303.tar.gz')
md5sums=('d379961598b8a3c4a67a9d26df291c40')

package() {
	cd "${srcdir}/gocode-v.20150303/vim"
	install --directory "${pkgdir}/usr/share/vim/vimfiles"
	cp -r autoload "${pkgdir}/usr/share/vim/vimfiles"
	cp -r ftplugin "${pkgdir}/usr/share/vim/vimfiles"
}
