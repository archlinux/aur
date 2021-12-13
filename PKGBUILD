# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Razer <razer[AT]neuf[DOT]fr>

pkgbase=django-redis
pkgname=python-django-redis
pkgver=5.1.0
pkgrel=1
pkgdesc="Full featured redis cache backend for Django"
arch=('any')
license=('BSD')
url="https://github.com/niwinz/django-redis"
makedepends=('python' 'python-setuptools' 'python-redis')
source=("https://pypi.io/packages/source/d/${pkgbase}/${pkgbase}-${pkgver}.tar.gz")
sha256sums=('98fb3d31633a1addea1aeb558a647359908bbcf78c0833f99496c5348fe3c1b4')

package_python-django-redis() {
  cd "${srcdir}/${pkgbase}-${pkgver}"
  python setup.py install --root="${pkgdir}" -O1
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
