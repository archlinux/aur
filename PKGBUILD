# Maintainer: N3mesis98 <adrienjacquet at openmailbox dot org>
pkgname=yaate
pkgver=1.0.1
pkgrel=1
pkgdesc="Simple yet powerful command line audio tag editor written in Python and using the TagLib library"
arch=('any')
url="https://github.com/N3mesis98/$pkgname"
license=('LGPL3+')
depends=('python' 'taglib' 'python-pytaglib')
makedepends=()
source=("https://github.com/N3mesis98/$pkgname/archive/$pkgver.tar.gz")
md5sums=('213e07323c06761deb8f7de77dfb7fdb')
provides=($pkgname)
conflicts=($pkgname)

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -D $pkgname.py "$pkgdir/usr/bin/$pkgname"
}
