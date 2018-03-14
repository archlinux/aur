# Maintainer: sasvari <sasvari@fastmail.com>
pkgname=python-ezdxf
_pkgname=ezdxf
pkgver=0.8.7
pkgrel=1
pkgdesc="A Python package to create/manipulate DXF drawings."
arch=(any)
url="http://ezdxf.readthedocs.io/"
license=('MIT')
depends=('python')
sha256sums=('882b2518fbdce86acb177c4f55d1f07034b385a96d6b22833962bad0f7983c57')
source=("https://github.com/mozman/$_pkgname/archive/v$pkgver.tar.gz")

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py install --optimize=1 --root="$pkgdir/" --prefix="/usr"
}
