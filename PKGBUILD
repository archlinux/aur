# Maintainer: Erhan SAHIN < erhan@ssahin.net >

pkgname=("python2-saharaclient-liberty")
pkgver="0.9.1"
pkgrel="1"
pkgdesc="Python client library for Sahara"
arch=("any")
url="https://launchpad.net/python-saharaclient"
license=("Apache")
makedepends=("python2-setuptools")
source=("https://pypi.python.org/packages/source/p/python-saharaclient/python-saharaclient-${pkgver}.tar.gz")
sha256sums=('7037c44bbdbfee1e6e8023431d912cab34b05f4beaed16f9ac150d8207cf99fc')

package() {
    depends=("python2-pbr>=0.11"
             "python2-babel>=1.3"
             "python2-netaddr>=0.7.12"
	     "python2-oslo-i18n-liberty"
	     "python2-oslo-utils-liberty"
	     "python2-keystoneclient-liberty"
	     "python2-requests>=2.5.2"
             "python2-six>=1.9.0"
             "python2-prettytable>=0.7"
             "python2-argparse")
    cd "${srcdir}/python-saharaclient-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
}
