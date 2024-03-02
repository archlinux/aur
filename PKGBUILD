# Maintainer: Ivan Batrakov <blackfan321 at disroot dot org>
# Contributor: Benjamin A. Shelton <zancarius@gmail.com>

pkgname=python-httpagentparser
pkgver=1.9.5
pkgrel=1
pkgdesc='Extracts OS browser information from the user agent string.'
arch=('any')
url='http://pypi.python.org/pypi/httpagentparser'
license=('MIT')
depends=('python')
makedepends=('python-setuptools')

source=("https://pypi.python.org/packages/source/h/httpagentparser/httpagentparser-${pkgver}.tar.gz")
sha256sums=(
    '53cefd9d65990f6fe59c0378cad8ea1b9df8f770d2e8bd9d8762edae033be80a'
)
package () {
    cd "${srcdir}/httpagentparser-${pkgver}"
    python setup.py install --root="${pkgdir}/" --optimize=1
}
