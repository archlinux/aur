# Maintainer: Amael <nils[DOT]van-zuijlen[AT]mailo[DOT]com>

pkgbase=python-django-redis-cache
pkgname=('python-django-redis-cache')
pkgver=2.0.0
pkgrel=0
pkgdesc="A Redis cache backend for django"
arch=('any')
license=('BSD')
url="http://github.com/sebleier/django-redis-cache/"
makedepends=('python' 'python-setuptools' 'python-redis')
source=("https://pypi.io/packages/source/d/${pkgbase}/${pkgbase}-${pkgver}.tar.gz")
sha256sums=('77dcb9d11beef5ce77dadfb95328b7712c3d9bde8419a0ba92968712b9bff48b')

package_python-django-redis-cache() {
  cd "${srcdir}/${pkgbase}-${pkgver}"
  python setup.py install --root="${pkgdir}" -O1
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
