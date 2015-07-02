# Maintainer: Erhan SAHIN < erhan@ssahin.net >

pkgname=("python2-glanceclient-liberty")
pkgver="0.19.0"
pkgrel="1"
pkgdesc="OpenStack Image API Client Library"
arch=("any")
url="https://launchpad.net/python-glanceclient"
license=("Apache")
makedepends=("python2-setuptools")
source=("https://pypi.python.org/packages/source/p/python-glanceclient/python-glanceclient-${pkgver}.tar.gz")
sha256sums=('45115023cadfdbc24a10b10ca5d003f8f04fd5642b7c8fb565efa566bac4bf51')

package() {
    depends=("python2-pbr>=0.11"
             "python2-babel>=1.3"
             "python2-argparse"
             "python2-prettytable>=0.7"
	     "python2-keystoneclient-liberty"
             "python2-pyopenssl>=0.11"
	     "python2-requests>=2.5.2"
             "python2-warlock>=1.0.1"
             "python2-six>=1.9.0"
	     "python2-oslo-utils-liberty"
	     "python2-oslo-i18n-liberty"
     )
    cd "${srcdir}/python-glanceclient-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
}
