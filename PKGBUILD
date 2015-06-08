_name=schema
pkgname="python-$_name"
pkgver=0.3.1
pkgrel=1
pkgdesc='Python module to validate and convert data structures.'
arch=('i686' 'x86_64')
url="https://github.com/halst/$_name"
license=('MIT')
depends=('python')
source=("https://pypi.python.org/packages/source/s/$_name/$_name-$pkgver.tar.gz")
sha1sums=('732ef97af28bcc8667ab3cbb1e8c1ac2668623d4')

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
	install -Dm644 {,"$pkgdir/usr/share/licenses/$pkgname/"}LICENSE-MIT
}