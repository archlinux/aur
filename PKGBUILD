# Maintainer: Erhan SAHIN < erhan@ssahin.net >

pkgname=("python2-ceilometerclient-kilo")
pkgver="1.0.14"
pkgrel="1"
pkgdesc="Python client library for Ceilometer"
arch=("any")
url="https://launchpad.net/python-ceilometerclient"
license=("Apache")
makedepends=("python2-setuptools")
source=("https://pypi.python.org/packages/source/p/python-ceilometerclient/python-ceilometerclient-${pkgver}.tar.gz")
sha256sums=('59ef7d588846d30f2efceaead6704da72953c069db784ea94eda489ea5a0197f')

package() {
    depends=("python2-pbr>=0.6"
             "python2-argparse"
             "python2-iso8601>=0.1.9"
	     "python2-oslo-i18n-kilo"
	     "python2-oslo-serialization-kilo"
	     "python2-oslo-utils-kilo"
             "python2-prettytable>=0.7"
	     "python2-keystoneclient-kilo"
	     "python2-requests>=2.2.0"
             "python2-six>=1.7.0"
	     "python2-stevedore-kilo")
    cd "${srcdir}/python-ceilometerclient-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
}
