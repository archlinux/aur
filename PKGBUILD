# Maintainer: Erhan SAHIN < erhan@ssahin.net >

pkgname=("python2-troveclient-liberty")
pkgver="1.2.0"
pkgrel="1"
pkgdesc="Trove client binding"
arch=("any")
url="https://launchpad.net/python-troveclient"
license=("Apache")
makedepends=("python2-setuptools")
source=("https://pypi.python.org/packages/source/p/python-troveclient/python-troveclient-${pkgver}.tar.gz")
sha256sums=('a0583f5b102953c433de01ef3b4964e78dab3f0a64c6dea5b0e09ef8e87d4b30')

package() {
    depends=("python2-pbr>=0.11"
             "python2-argparse"
             "python2-prettytable>=0.7"
	     "python2-requests>=2.5.2"
	     "python2-simplejson>=2.2.0"
	     "python2-oslo-utils-liberty"
	     "python2-keystoneclient-liberty"
             "python2-babel>=1.3"
             "python2-six>=1.9.0")
    cd "${srcdir}/python-troveclient-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
}
