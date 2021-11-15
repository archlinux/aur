# Maintainer: Benjamin A. Shelton <zancarius@gmail.com>
# Source: https://github.com/zancarius/archlinux-pkgbuilds

pkgname=python2-httpagentparser
pkgver=1.9.1
pkgrel=1
pkgdesc='Extracts OS browser information from the user agent string.'
arch=('any')
url='http://pypi.python.org/pypi/httpagentparser'
license=('MIT')
depends=('python2')
makedepends=('python2-setuptools')

source=("https://pypi.python.org/packages/source/h/httpagentparser/httpagentparser-${pkgver}.tar.gz")
sha256sums=(
    'ef763d31993dd761825acee6c8b34be32b95cf1675d1c73c3cd35f9e52831b26'
)

package () {
    cd "${srcdir}/httpagentparser-${pkgver}"
    python2 setup.py install --root="${pkgdir}/" --optimize=1
}
