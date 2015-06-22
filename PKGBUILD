pkgname=urxvt-vim-insert
pkgver=1.f0703b3
pkgrel=1
pkgdesc="Shift-Insert fix for terminal vim"
arch=('any')
url='https://github.com/seletskiy/urxvt-vim-insert'
depends=('rxvt-unicode')
makedepends=('git')
source=('git+https://github.com/seletskiy/urxvt-vim-insert')
sha1sums=('SKIP')

pkgver() {
	cd "${pkgname}"
	echo $(git rev-list --count master).$(git rev-parse --short master)
}

package() {
	cd "${pkgname}"
	install -Dm644 'vim-insert' "${pkgdir}/usr/lib/urxvt/perl/vim-insert"
}

