# Maintainer: sasvari <sasvari@fastmail.com>
pkgname=python-ezdxf
_pkgname=ezdxf
pkgver=0.8.8
pkgrel=1
pkgdesc="A Python package to create/manipulate DXF drawings."
arch=(any)
url="http://ezdxf.readthedocs.io/"
license=('MIT')
depends=('python')
sha256sums=('c0a00ed6b7a4daf3e91934cc96d09a5d2a8c7de243f0ce932f68c16f773ac768')
source=("https://github.com/mozman/$_pkgname/archive/v$pkgver.tar.gz")

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py install --optimize=1 --root="$pkgdir/" --prefix="/usr"
}
