# Maintainer: Razer <razer[AT]neuf[DOT]fr>

pkgbase=django-redis
pkgname=('python-django-redis')
pkgver=4.8.0
pkgrel=1
pkgdesc="Full featured redis cache backend for Django"
arch=('any')
license=('BSD')
url="https://github.com/niwinz/django-redis"
makedepends=('python' 'python-setuptools' 'python-redis')
source=("https://github.com/niwinz/${pkgbase}/archive/${pkgver}.tar.gz")
md5sums=('4464b99d729289fa06a726e68a2035b9')

package_python-django-redis() {
  cd "${srcdir}/${pkgbase}-${pkgver}"
  python setup.py install --root="${pkgdir}" -O1
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
