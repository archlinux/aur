# Maintainer: Erhan SAHIN < erhan@ssahin.net >

pkgname=("python2-troveclient-kilo")
pkgver="1.0.9"
pkgrel="1"
pkgdesc="Trove client binding"
arch=("any")
url="https://launchpad.net/python-troveclient"
license=("Apache")
makedepends=("python2-setuptools")
source=("https://pypi.python.org/packages/source/p/python-troveclient/python-troveclient-${pkgver}.tar.gz")
sha256sums=('ed9fad408c249a37e779a305cadb5cdecc656891eed27bc34b9d99f425a3fd69')

package() {
    depends=("python2-pbr>=0.6"
             "python2-argparse"
             "python2-prettytable>=0.7"
	     "python2-requests>=2.2.0"
	     "python2-simplejson>=2.2.0"
	     "python2-oslo-utils-kilo"
	     "python2-keystoneclient-kilo"
             "python2-babel>=1.3"
             "python2-six>=1.9.0")
    cd "${srcdir}/python-troveclient-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
}
