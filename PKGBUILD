_name="hug"
pkgname=('python-hug')
pkgver='2.6.0'
pkgrel=2
pkgdesc="Embrace the APIs of the future"
url="https://github.com/hugapi/hug"
depends=('python' 'python-falcon')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://github.com/hugapi/hug/archive/${pkgver}.tar.gz")
sha256sums=('c54b04ed5ce0e436ddf9e8e00f838b4ed740a914cf3af9bef055e11375fc1ebe')

build() {
	    cd "$srcdir/${_name}-${pkgver}"
	    python setup.py build
	}

package() {
	    depends+=()
	    cd "$srcdir/${_name}-${pkgver}"
		python setup.py install --root="$pkgdir" --optimize=1
	    }
