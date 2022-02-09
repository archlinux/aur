# Maintainer: Benjamin A. Shelton <zancarius@gmail.com>
# Source: https://github.com/zancarius/archlinux-pkgbuilds

pkgname=python-httpagentparser
pkgver=1.9.2
pkgrel=1
pkgdesc='Extracts OS browser information from the user agent string.'
arch=('any')
url='http://pypi.python.org/pypi/httpagentparser'
license=('MIT')
depends=('python')
makedepends=('python-setuptools')

source=("https://pypi.python.org/packages/source/h/httpagentparser/httpagentparser-${pkgver}.tar.gz")
sha256sums=(
    'a190dfdc5e63b2f1c87729424b19cbc49263d6a1fb585a16ac1c9d9ce127a4bf'
)
package () {
    cd "${srcdir}/httpagentparser-${pkgver}"
    python setup.py install --root="${pkgdir}/" --optimize=1
}
