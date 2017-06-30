# Maintainer: Zhuoyun Wei <wzyboy@wzyboy.org>

pkgname='fava'
pkgdesc='Web interface for beancount'
pkgver=1.4
pkgrel=1
arch=('any')
url='https://github.com/beancount/fava'
license=('GPL')
source=("https://github.com/beancount/fava/archive/v${pkgver}.tar.gz")
sha256sums=('aa9aeb5c49da715e80206fd65859ce18d61ef1f22af7ccb82eafec559db91410')
depends=('beancount' 'python-click' 'python-markdown2' 'python-flask' 'python-flask-babel')
makedepends=('npm')

package () {
  cd "${pkgname}-${pkgver}"
  make
  python setup.py install --prefix=/usr --root="${pkgdir}"
}
