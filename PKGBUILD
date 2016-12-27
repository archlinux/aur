# Maintainer: Zhuoyun Wei <wzyboy@wzyboy.org>

pkgname='fava'
_pkgname='beancount-fava'
pkgdesc='Web interface for beancount'
pkgver=1.2
pkgrel=1
arch=('any')
url='https://github.com/beancount/fava'
license=('GPL')
source=("https://github.com/beancount/fava/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('777cd74a0c432d067f77e18728d6c9d33ab18903da4aaaa6c2ec697d5633273c')
depends=('beancount' 'python-click' 'python-markdown2' 'python-flask' 'python-flask-babel')

package () {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}"
}
