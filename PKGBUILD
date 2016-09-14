# Maintainer: mdraw.gh at gmail dot com

pkgname='python-colorlog'
pkgver='2.7.0'
pkgrel=2
pkgdesc="Log formatting with colors"
arch=('any')
url='https://github.com/borntyping/python-colorlog'
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
conflicts=('python-colorlog-git')
source=("https://github.com/borntyping/python-colorlog/archive/${pkgver}.tar.gz")
md5sums=('a39a0ab37877a0b682f493f8ce23ad0b')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}
