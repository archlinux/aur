# Maintainer: Vladimir Gorbunov <truedaemon@gmail.com>

pkgbase=python-svglib
pkgname=('python-svglib')
_name=svglib
pkgver=1.0.0
pkgrel=1
pkgdesc="A pure-Python library for reading and converting SVG files."
arch=('any')
url="http://pypi.python.org/pypi/svglib/$pkgver"
license=('LGPL')
options=(!emptydirs)
depends=('python'
         'python-lxml'
         'python-cssselect2'
         'python-tinycss2'
         'python-reportlab')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('b17d4a6352f6c25ca3718d2b66a2f1ecfcdf558b1f6646c37f5c191b655979f1')

package_python-svglib() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1
}
