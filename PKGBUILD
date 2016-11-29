# Maintainer: Zhuoyun Wei <wzyboy@wzyboy.org>

pkgname='fava'
_pkgname='beancount-fava'
pkgdesc='Web interface for beancount'
pkgver=1.1
pkgrel=1
arch=('any')
url='https://github.com/beancount/fava'
license=('GPL')
source=("https://github.com/beancount/fava/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('d25197cf5c9aa634ad8940825f3b4d041812aebab95dba09849d306ee420c65f')
depends=('beancount' 'python-click' 'python-markdown2' 'python-flask' 'python-flask-babel')

package () {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}"
}
