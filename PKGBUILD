# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Razer <razer[AT]neuf[DOT]fr>

pkgbase=django-redis
pkgname=('python-django-redis')
pkgver=4.12.1
pkgrel=1
pkgdesc="Full featured redis cache backend for Django"
arch=('any')
license=('BSD')
url="https://github.com/niwinz/django-redis"
makedepends=('python' 'python-setuptools' 'python-redis')
source=("https://pypi.io/packages/source/d/${pkgbase}/${pkgbase}-${pkgver}.tar.gz")
sha256sums=('306589c7021e6468b2656edc89f62b8ba67e8d5a1c8877e2688042263daa7a63')

package_python-django-redis() {
  cd "${srcdir}/${pkgbase}-${pkgver}"
  python setup.py install --root="${pkgdir}" -O1
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}


