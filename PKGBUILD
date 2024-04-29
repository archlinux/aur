# Maintainer: Simon Boulay <simon.boulay@alkeona.net>
# Contributor: Melvin Vermeeren <mail@mel.vin>

_name=sphinxcontrib-tikz
pkgname=("python-${_name}")
pkgver=0.4.19
pkgrel=1
pkgdesc="TikZ extension for Sphinx."
arch=('any')
url="https://bitbucket.org/philexander/tikz"
license=('BSD')
makedepends=('python' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('81e9fe6c7e0dbc46f19f1af91d2b62b01d41ab22884b89f55681f200ae265d49')

package_python-sphinxcontrib-tikz() {
  depends=('python' 'python-setuptools')

  cd "sphinxcontrib-tikz-$pkgver"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}
