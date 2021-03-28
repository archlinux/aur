# Maintainer: Twann <twann@ctemplar.com>

pkgname=mxl
pkgver=1.0.4
pkgrel=2
provides=("$pkgname")
pkgdesc="Delete sensitive files in panic situations"
url="https://codeberg.org/twann/$pkgname"
arch=("any")
license=("MIT")
makedepends=("git")
depends=("python-setuptools" "python>=3" "python-colorama")
source=("git+https://codeberg.org/twann/$pkgname.git")
md5sums=("SKIP")

package()
{
	cd "$pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	python setup.py install --root="$pkgdir"
}


