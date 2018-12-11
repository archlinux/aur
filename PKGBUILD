# Maintainer: Razer <razer[AT]neuf[DOT]fr>

pkgbase=django-redis
pkgname=('python-django-redis')
pkgver=4.10.0
pkgrel=0
pkgdesc="Full featured redis cache backend for Django"
arch=('any')
license=('BSD')
url="https://github.com/niwinz/django-redis"
makedepends=('python' 'python-setuptools' 'python-redis')
source=("https://pypi.io/packages/source/d/${pkgbase}/${pkgbase}-${pkgver}.tar.gz")
sha256sums=('af0b393864e91228dd30d8c85b5c44d670b5524cb161b7f9e41acc98b6e5ace7')

package_python-django-redis() {
  cd "${srcdir}/${pkgbase}-${pkgver}"
  python setup.py install --root="${pkgdir}" -O1
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}


