# Maintainer: Erhan SAHIN < erhan@ssahin.net >

pkgname=("python2-heatclient-kilo")
pkgver="0.4.0"
pkgrel="1"
pkgdesc="Python client library for Heat"
arch=("any")
url="https://launchpad.net/python-heatclient"
license=("Apache")
makedepends=("python2-setuptools")
source=("https://pypi.python.org/packages/source/p/python-heatclient/python-heatclient-${pkgver}.tar.gz")
sha256sums=('1b71e2bb5c380ac6b2e1f07b48b7b3e82e7364cc43255ed696c795ab5f8d5a1d')

package() {
    depends=("python2-babel>=1.3"
             "python2-pbr>=0.6"
             "python2-argparse"
             "python2-iso8601>=0.1.9"
             "python2-prettytable>=0.7"
	     "python2-oslo-i18n-kilo"
	     "python2-oslo-serialization-kilo"
	     "python2-oslo-utils-kilo"
	     "python2-keystoneclient-kilo"
	     "python2-swiftclient-kilo"
             "python2-yaml"
	     "python2-requests>=2.2.0"
             "python2-six>=1.7.0")
    cd "${srcdir}/python-heatclient-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
}
