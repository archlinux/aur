# Maintainer: Zhuoyun Wei <wzyboy@wzyboy.org>

pkgname='fava'
_pkgname='beancount-fava'
pkgdesc='Web interface for beancount'
pkgver=0.3.0
pkgrel=1
arch=('any')
url='https://aumayr.github.io/fava/'
license=('GPL')
source=("https://github.com/aumayr/${pkgname}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('d70ed37a35fa3adeaca519e6eb7ef4ee0b8190dd69f64ce04e8e0b5f15d0bca8')
depends=('beancount' 'python-click' 'python-pygments' 'python-beancount-pygments-lexer'
         'python-markdown2' 'python-flask' 'python-flask-babel' 'python-livereload')
conflicts=('beancount-hg')

package () {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}"
}
