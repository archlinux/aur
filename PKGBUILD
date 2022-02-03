# Maintainer: Hans Müller <schreibemirhalt@gmail.com>
pkgname=tho_old
pkgver=1
pkgrel=1
arch=('any')
license=('non-free')
depends=('dosbox-x')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("$pkgname::git+https://github.com/yjacks/tho_old.git")
md5sums=('SKIP')

package() {
	cd "$srcdir/$pkgname"
	cp -rf "../$pkgname" "$srcdir/../pkg/"
	chmod a+x "$srcdir/../pkg/$pkgname/usr/share/applications/tho_old.desktop"
	rm -rf "$srcdir/../pkg/$pkgname/.git"
}

