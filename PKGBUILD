# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgbase=django-redis
pkgname=('python-django-redis' 'python2-django-redis')
pkgver=4.3.0
pkgrel=1
pkgdesc="Full featured redis cache backend for Django"
arch=('any')
license=('BSD')
url="https://github.com/niwinz/django-redis"
makedepends=('python' 'python-setuptools' 'python-redis' 'python2'
             'python2-setuptools' 'python2-redis')
source=("https://github.com/niwinz/django-redis/archive/${pkgver}.tar.gz")
md5sums=('a017822f920fd7ad25d6450136f518c8')

package_python-django-redis() {
  depends=('python' 'python-redis')

  cd "${srcdir}/${pkgbase}-${pkgver}"

  python setup.py install --root="${pkgdir}" -O1
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-django-redis() {
  depends=('python2' 'python2-redis')

  cd "${srcdir}/${pkgbase}-${pkgver}"

  python2 setup.py install --root="${pkgdir}" -O1
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
