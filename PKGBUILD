# Maintainer: Kenneth Endfinger <kaendfinger@gmail.com>

pkgbase=django-rq
pkgname=('python-django-rq')
pkgver=2.3.1
pkgrel=1
pkgdesc="A simple app that provides django integration for RQ (Redis Queue)"
arch=('any')
license=('MIT')
url="https://github.com/ui/django-rq"
makedepends=('python' 'python-setuptools' 'python-django' 'python-rq')
source=("django-rq-${pkgver}.tar.gz::https://github.com/ui/django-rq/archive/v${pkgver}.tar.gz")
sha512sums=('a87c06c68aff9951964ee70d8a2106eb29bc7da9005ab3a200c2104869d76e032bf7bef052136107f601f4ce7508efee62e4bf544c5c7ee98baae7ccfaa56c62')

package_python-django-rq() {
  depends=('python' 'python-django' 'python-rq')

  cd "${srcdir}/${pkgbase}-${pkgver}"

  python setup.py install --root="${pkgdir}" -O1
  install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
