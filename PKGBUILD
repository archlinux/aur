# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Razer <razer[AT]neuf[DOT]fr>

pkgbase=django-redis
pkgname=python-django-redis
pkgver=5.2.0
pkgrel=1
pkgdesc="Full featured redis cache backend for Django"
arch=('any')
license=('BSD')
url="https://github.com/niwinz/django-redis"
makedepends=('python' 'python-setuptools' 'python-redis')
source=("https://pypi.io/packages/source/d/${pkgbase}/${pkgbase}-${pkgver}.tar.gz")
sha256sums=('8a99e5582c79f894168f5865c52bd921213253b7fd64d16733ae4591564465de')

package_python-django-redis() {
  cd "${srcdir}/${pkgbase}-${pkgver}"
  python setup.py install --root="${pkgdir}" -O1
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
