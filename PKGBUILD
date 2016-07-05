# Maintainer: Zhuoyun Wei <wzyboy@wzyboy.org>

pkgname='python-beancount-pygments-lexer'
_pkgname='beancount-pygments-lexer'
pkgdesc='A pygments-lexer for beancount-files'
pkgver=0.1.2
pkgrel=1
arch=('any')
url="https://pypi.python.org/pypi/beancount-pygments-lexer"
license=('GPL')
source=("https://pypi.python.org/packages/e0/58/583e0c51a92502a2e9c564af1a59ad78c544fe4a15bf39afbcd8f645da11/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('b8311c9c0171cd9478ae222d70e14ffa975ee1755976cae5a3501a37591a3462')

package () {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}"
}
