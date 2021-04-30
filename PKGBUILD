# Maintainer: Matt C <matt@xhec.us>
pkgname=aurtomatic-git
_pkgname=aurtomatic
pkgver=1.0
pkgrel=1
pkgdesc="manage local AUR repo"
arch=('any')
url="https://github.com/SomethingGeneric/aurtomatic"
license=('custom:nolicense')
depends=('python')
provides=('aurtomatic')

source=("${_pkgname}::git+https://github.com/SomethingGeneric/aurtomatic.git")

md4sums=("SKIP")

package() {
	mkdir -p $pkgdir/usr/bin
	mkdir -p $pkgdir/usr/share/licenses/$_pkgname
	cd $_pkgname
	chmod +x aurtomatic.py
	cp aurtomatic.py $pkgdir/usr/bin/aurtomatic
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
md5sums=('SKIP')
