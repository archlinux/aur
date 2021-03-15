# Maintainer: Twann <twann@ctemplar.com>

pkgname=mxl
pkgver=1.0.3
pkgrel=1
provides=("$pkgname")
pkgdesc="Delete sensitive files in panic situations"
url="https://gitlab.com/twann4/$pkgname"
arch=("any")
license=("MIT")
makedepends=("git")
depends=("python-setuptools" "python>=3" "python-colorama")
source=("git+https://gitlab.com/twann4/$pkgname.git")
md5sums=("SKIP")

package()
{
	cd "$pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	python setup.py install --root="$pkgdir"
}


