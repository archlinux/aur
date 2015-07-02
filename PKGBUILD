# Maintainer: Erhan SAHIN < erhan@ssahin.net >

pkgname=("python2-heatclient-liberty")
pkgver="0.6.0"
pkgrel="1"
pkgdesc="Python client library for Heat"
arch=("any")
url="https://launchpad.net/python-heatclient"
license=("Apache")
makedepends=("python2-setuptools")
source=("https://pypi.python.org/packages/source/p/python-heatclient/python-heatclient-${pkgver}.tar.gz")
sha256sums=('fe293e11d145d86b92649063eb50d1f599dab88a327707d76a72b12022b77bbb')

package() {
    depends=("python2-babel>=1.3"
             "python2-pbr>=0.11"
             "python2-argparse"
             "python2-iso8601>=0.1.9"
             "python2-prettytable>=0.7"
	     "python2-oslo-i18n-liberty"
	     "python2-oslo-serialization-liberty"
	     "python2-oslo-utils-liberty"
	     "python2-keystoneclient-liberty"
	     "python2-swiftclient-liberty"
             "python2-yaml>=3.1.0"
	     "python2-requests>=2.5.2"
             "python2-six>=1.9.0")
    cd "${srcdir}/python-heatclient-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
}
