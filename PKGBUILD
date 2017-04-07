pkgname=('python-tornado-jinja2')
pkgver=0.2.4
pkgrel=1
pkgdesc="jinja2 Engine for tornado web framework"
arch=('any')
url="http://github.com/mr-ping/tornado_jinja2"
depends=("python-jinja" "python-tornado")
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/36/be/f93459eb02120239446bbceecf92d1c39bed2c43e6b0df00736fffa6d767/tornado_jinja2-0.2.4.tar.gz")
md5sums=('b29ba402ed361a9425d1a6a014ecff45')

build() {
  cd ${srcdir}/tornado_jinja2-${pkgver}
  touch DESCRIPTION.rst
  python setup.py build
}

package() {
  cd ${srcdir}/tornado_jinja2-${pkgver}
  python setup.py install --prefix=/usr --root=${pkgdir}
}

