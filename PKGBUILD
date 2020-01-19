# Maintainer: Amael <nils[DOT]van-zuijlen[AT]mailo[DOT]com>

_pkgbase=django-redis-cache
pkgbase=python-${_pkgbase}
pkgname=($pkgbase)
pkgver=2.1.0
pkgrel=0
pkgdesc="A Redis cache backend for django"
arch=('any')
license=('BSD')
url="http://github.com/sebleier/django-redis-cache/"
makedepends=('python' 'python-setuptools' 'python-redis')
source=("https://pypi.io/packages/source/d/${_pkgbase}/${_pkgbase}-${pkgver}.tar.gz")
sha256sums=('5c581743de5994e6b15abfd5b3dbcb8bf00e42d97658c96b7218bcb6a63f863b')

package_python-django-redis-cache() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  python setup.py install --root="${pkgdir}" -O1
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
