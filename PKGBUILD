# Maintainer: Erhan SAHIN < erhan@ssahin.net >

pkgname=("python2-ceilometerclient-liberty")
pkgver="1.3.0"
pkgrel="1"
pkgdesc="Python client library for Ceilometer"
arch=("any")
url="https://launchpad.net/python-ceilometerclient"
license=("Apache")
makedepends=("python2-setuptools")
source=("https://pypi.python.org/packages/source/p/python-ceilometerclient/python-ceilometerclient-${pkgver}.tar.gz")
sha256sums=('54f5b99b7027d1a5031f47a5a9534a0a2aea3168274d0c1951dd1a347c44fdd6')

package() {
    depends=("python2-pbr>=0.11"
             "python2-argparse"
             "python2-iso8601>=0.1.9"
	     "python2-oslo-i18n-liberty"
	     "python2-oslo-serialization-liberty"
	     "python2-oslo-utils-liberty"
             "python2-prettytable>=0.7"
	     "python2-keystoneclient-liberty"
	     "python2-requests>=2.5.2"
             "python2-six>=1.9.0"
	     "python2-stevedore-openstack")
    cd "${srcdir}/python-ceilometerclient-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
}
