# Maintainer: N3mesis98 <adrienjacquet at openmailbox dot org>
pkgname=yaate
pkgver=1.0.7
pkgrel=1
pkgdesc="Simple yet powerful command line audio tag editor written in Python and using the TagLib library"
arch=('any')
url="https://github.com/N3mesis98/$pkgname"
license=('LGPL3+')
depends=('python' 'taglib' 'python-pytaglib')
makedepends=()
source=("https://github.com/N3mesis98/$pkgname/archive/$pkgver.tar.gz")
md5sums=('54e8b68a2e50fe7fe91b15a4e9655294')
provides=($pkgname)
conflicts=($pkgname)

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -D $pkgname.py "$pkgdir/usr/bin/$pkgname"
}
