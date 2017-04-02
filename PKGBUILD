# Maintainer: Zhuoyun Wei <wzyboy@wzyboy.org>

pkgname='fava'
pkgdesc='Web interface for beancount'
pkgver=1.3
pkgrel=1
arch=('any')
url='https://github.com/beancount/fava'
license=('GPL')
source=("https://github.com/beancount/fava/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('831ba134aaca15cec93e9ccda536b5ca237c246532ef0bb841bbc2d28065dd44')
depends=('beancount' 'python-click' 'python-markdown2' 'python-flask' 'python-flask-babel')

package () {
  cd "${pkgname}-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}"
}
