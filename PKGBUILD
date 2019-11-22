_name="hug"
pkgname=('python-hug')
pkgver='2.4.8'
pkgrel=1
pkgdesc="Embrace the APIs of the future"
url="https://github.com/hugapi/hug"
depends=('python' 'falkon')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://github.com/hugapi/hug/archive/${pkgver}.tar.gz")
sha256sums=('06cd6293fa71e1d101fbb89b8e6816a7c77025801231117f8f73409592db278e')

build() {
	    cd "$srcdir/${_name}-${pkgver}"
	    python setup.py build
	}

package() {
	    depends+=()
	    cd "$srcdir/${_name}-${pkgver}"
		python setup.py install --root="$pkgdir" --optimize=1
	    }
