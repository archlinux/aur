# Maintainer: sasvari <sasvari@fastmail.com>
pkgname=python-ezdxf
_pkgname=ezdxf
pkgver=0.8.2
pkgrel=1
pkgdesc="A Python package to create/manipulate DXF drawings."
arch=(any)
url="http://ezdxf.readthedocs.io/"
license=('MIT')
depends=('python')
sha256sums=('60ebedbb0c6ec3071af81f01247a3e09afef0c325b7448fb409331755a844008')
source=("https://github.com/mozman/$_pkgname/archive/v$pkgver.tar.gz")

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py install --optimize=1 --root="$pkgdir/" --prefix="/usr"
}
