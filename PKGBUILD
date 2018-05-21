# Maintainer: Razer <razer[AT]neuf[DOT]fr>

pkgbase=django-redis
pkgname=('python-django-redis')
pkgver=4.9.0
pkgrel=0
pkgdesc="Full featured redis cache backend for Django"
arch=('any')
license=('BSD')
url="https://github.com/niwinz/django-redis"
makedepends=('python' 'python-setuptools' 'python-redis')
source=("https://pypi.io/packages/source/d/${pkgbase}/${pkgbase}-${pkgver}.tar.gz")
#source=("https://github.com/niwinz/${pkgbase}/archive/${pkgver}.tar.gz")
sha256sums=('15b47faef6aefaa3f47135a2aeb67372da300e4a4cf06809c66ab392686a2155')

package_python-django-redis() {
  cd "${srcdir}/${pkgbase}-${pkgver}"
  python setup.py install --root="${pkgdir}" -O1
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}


