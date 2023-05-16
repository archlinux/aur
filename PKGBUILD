# Maintainer: éclairevoyant

pkgname=bashplus
pkgver=0.1.0
pkgrel=1
pkgdesc="Collection of useful Bash functions"
arch=(any)
url="https://github.com/ingydotnet/$pkgname"
license=(MIT)
depends=(bash)
makedepends=(git)
source=("git+$url.git?commit=030d196bf621e971e223e95e73c235e6992b85e0")
b2sums=('SKIP')
_libname=bash+

package() {
	cd $pkgname
	install -vDm755 lib/$_libname.bash -t "$pkgdir/usr/lib/"
	install -vDm644 man/man3/$_libname.3 -t "$pkgdir/usr/share/man/man3/"
	install -vDm644 License "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
