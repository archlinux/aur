# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgbase=django-transaction-hooks
pkgname=('python-django-transaction-hooks' 'python2-django-transaction-hooks')
pkgver=0.2
pkgrel=1
pkgdesc="Django database backends that permit registering post-transaction-commit hooks"
arch=('any')
license=('BSD')
url="https://github.com/carljm/django-transaction-hooks"
makedepends=('python' 'python-setuptools' 'python-django' 'python2'
             'python2-setuptools' 'python2-django')
source=("https://github.com/carljm/django-transaction-hooks/archive/v${pkgver}.tar.gz")
md5sums=('fad01e8733d0bea7dc0e6d69a47e31fb')

package_python-django-transaction-hooks() {
  depends=('python' 'python-django')

  cd "${srcdir}/${pkgbase}-${pkgver}"

  python setup.py install --root="${pkgdir}" -O1
  install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

package_python2-django-transaction-hooks() {
  depends=('python2' 'python2-django')

  cd "${srcdir}/${pkgbase}-${pkgver}"

  python2 setup.py install --root="${pkgdir}" -O1
  install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
