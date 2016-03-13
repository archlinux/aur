# Maintainer: Dylan Whichard <dylan@whichard.com>
_name=idiotic
pkgname=idiotic
pkgver=0.1.0
pkgrel=1
pkgdesc='Distributed home automation controller'
arch=('any')
url="https://github.com/umbc-hackafe/$_name"
license=('MIT')
depends=('python>=3.4' 'python-aiohttp>=0.21.2' 'python-docopt>=0.6.2' 'python-flask-aiohttp' 'python-pylint>=1.5.4' 'python-schedule>=0.3.2' 'python-werkzeug>=0.11.4')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
md5sums=('4022e03982f905b913ea7ca5c36e1573')

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 || return 1
}
