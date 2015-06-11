# Maintainer: Erhan SAHIN < erhan@ssahin.net >

pkgname=("python2-saharaclient-kilo")
pkgver="0.8.0"
pkgrel="1"
pkgdesc="Python client library for Sahara"
arch=("any")
url="https://launchpad.net/python-saharaclient"
license=("Apache")
makedepends=("python2-setuptools")
source=("https://pypi.python.org/packages/source/p/python-saharaclient/python-saharaclient-${pkgver}.tar.gz")
sha256sums=('cd212b85811118eb45ab5b2ade0a8cbf5418d5d6b9f4e7425b5026c293effb39')

package() {
    depends=("python2-pbr>=0.6"
             "python2-babel>=1.3"
             "python2-netaddr>=0.7.12"
	     "python2-oslo-i18n-kilo"
	     "python2-oslo-utils-kilo"
	     "python2-keystoneclient-kilo"
	     "python2-requests>=2.2.0"
             "python2-six>=1.7.0"
             "python2-prettytable>=0.7"
             "python2-argparse")
    cd "${srcdir}/python-saharaclient-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
}
