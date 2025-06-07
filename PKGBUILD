# Maintainer: Kenneth Endfinger <kaendfinger@gmail.com>

pkgbase=django-rq
pkgname=('python-django-rq')
pkgver=3.0.1
pkgrel=1
pkgdesc="A simple app that provides django integration for RQ (Redis Queue)"
arch=('any')
license=('MIT')
url="https://github.com/ui/django-rq"
makedepends=('python' 'python-setuptools' 'python-django' 'python-rq')
source=("django-rq-${pkgver}.tar.gz::https://github.com/ui/django-rq/archive/v${pkgver}.tar.gz")
sha512sums=('e439ae9bc71f56ca66c8cca38aa1521a667d9d46e4c60666d1725bcb0f06b256664c997847a3bc33c74747a1cd9c688d664395c68e688ec3257a715bd40559dc')

package_python-django-rq() {
  depends=('python' 'python-django' 'python-rq')

  cd "${srcdir}/${pkgbase}-${pkgver}"

  python setup.py install --root="${pkgdir}" -O1
  install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
