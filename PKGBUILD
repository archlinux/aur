pkgbase=('python-dirlog')
pkgname=('python-dirlog')
_module='dirlog'
pkgver='0.2.7'
pkgrel=1
pkgdesc="keep a log of directories you visit to get back fast"
url="https://github.com/ninjaaron/dirlog"
depends=('python')
makedepends=('python-setuptools')
license=('unknown')
arch=('any')
source=("https://pypi.python.org/packages/9f/a7/d93290b30ba78446f0d6b7ef4cdb48360fd45ad79c1c778341d170cc9767/dirlog-${pkgver}-py2-none-any.whl")
md5sums=('0cf32c9ef9f644935124c188534e4654')

build() {
    python setup.py build
}

package() {
    depends+=()
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
