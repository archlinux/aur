# Maintainer: Ekin Dursun <ekindursun@gmail.com>
# Contributor: Oliver Mangold omangold at gmail dot com

_name=uncompyle6
pkgname="python-${_name}"
pkgver=3.6.5
pkgrel=1
pkgdesc="Python byte-code disassembler and source-code converter."
arch=('any')
url="https://github.com/rocky/python-uncompyle6/"
license=('MIT')
depends=('python-spark-parser>=1.8.9' 'python-spark-parser<1.9.0' 'python-xdis>=4.2.4' 'python-xdis<4.3.0')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('ddbb2f9919464215fba4a7cc5522d1417e1e252d4940a11a6b3a888790d102ea')

package() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
