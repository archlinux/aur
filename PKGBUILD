# Maintainer: Benjamin A. Shelton <zancarius@gmail.com>
# Source: https://github.com/zancarius/archlinux-pkgbuilds

pkgname=python2-httpagentparser
pkgver=1.8.2
pkgrel=1
pkgdesc='Extracts OS browser information from the user agent string.'
arch=('any')
url='http://pypi.python.org/pypi/httpagentparser'
license=('MIT')
depends=('python2')
makedepends=('python2-setuptools')

source=("https://pypi.python.org/packages/source/h/httpagentparser/httpagentparser-${pkgver}.tar.gz")
sha256sums=(
    '77e1d03fb40f1c34afa2d210ed7667dddb5b601efa154513cd08713d17a3aa6c'
)

package () {
    cd "${srcdir}/httpagentparser-${pkgver}"
    python2 setup.py install --root="${pkgdir}/" --optimize=1
}
