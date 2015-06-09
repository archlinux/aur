# Maintainer: Erhan SAHIN < erhan@ssahin.net >

pkgname=("python2-barbicanclient-kilo")
pkgver="3.0.3"
pkgrel="2"
pkgdesc="Python client library for Barbican"
arch=("any")
url="https://launchpad.net/python-barbicanclient"
license=("Apache")
depends=("python2-pbr>=0.6"
         "python2-argparse"
         "python2-prettytable>=0.7"
	 "python2-requests>=2.2.0"
         "python2-six>=1.7.0"
	 "python2-keystoneclient-kilo"
	 "python2-cliff-kilo"
	 "python2-oslo-i18n-kilo"
	 "python2-oslo-serialization-kilo"
	 "python2-oslo-utils-kilo")
makedepends=("python2-setuptools")
source=("https://pypi.python.org/packages/source/p/python-barbicanclient/python-barbicanclient-${pkgver}.tar.gz")
sha256sums=('959aca2ce3af2eed0f57e2fa9f0f9a484e40adc6b371e2c0fcc588aae9ca2b18')

package() {
    cd "${srcdir}/python-barbicanclient-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
}
