# Maintainer: Benjamin A. Shelton <zancarius@gmail.com>
# Source: https://github.com/zancarius/archlinux-pkgbuilds

pkgname=python-httpagentparser
pkgver=1.7.7
pkgrel=1
pkgdesc="Extracts OS browser information from the user agent string."
arch=(any)
url="http://pypi.python.org/pypi/httpagentparser"
license=(MIT)
depends=(python)
makedepends=(python-setuptools)

source=("https://pypi.python.org/packages/source/h/httpagentparser/httpagentparser-${pkgver}.tar.gz")
md5sums=(1977d91ece2617e92fd5f1a5336e8320)

package () {
    
    cd "${srcdir}/httpagentparser-${pkgver}"
    python setup.py install --root="${pkgdir}/" --optimize=1

}
