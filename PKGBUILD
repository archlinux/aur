pkgname=urxvt-safe-paste
pkgver=1.21d424d
pkgrel=1
pkgdesc="Open editor when pasted text from clipboard contains newlines"
arch=('any')
url='https://github.com/seletskiy/urxvt-safe-paste'
depends=('rxvt-unicode')
makedepends=('git')
source=('git+https://github.com/seletskiy/urxvt-safe-paste')
sha1sums=('SKIP')

pkgver() {
	cd "${pkgname}"
	echo $(git rev-list --count master).$(git rev-parse --short master)
}

package() {
	cd "${pkgname}"
	install -Dm644 'safe-paste' "${pkgdir}/usr/lib/urxvt/perl/safe-paste"
}


