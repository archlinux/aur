# Maintainer: Kenneth Endfinger <kaendfinger@gmail.com>

pkgbase=django-rq
pkgname=('python-django-rq')
pkgver=3.0
pkgrel=1
pkgdesc="A simple app that provides django integration for RQ (Redis Queue)"
arch=('any')
license=('MIT')
url="https://github.com/ui/django-rq"
makedepends=('python' 'python-setuptools' 'python-django' 'python-rq')
source=("django-rq-${pkgver}.tar.gz::https://github.com/ui/django-rq/archive/v${pkgver}.tar.gz")
sha512sums=('09c9a420edfa21f52c87151d83ad5047f5ba61b1a8b4d686a9ac93bbdd1a3e0e7c8114d92218802e34043f92b6f4e3157edd8a1beba92ff33099c44c5d294bf3')

package_python-django-rq() {
  depends=('python' 'python-django' 'python-rq')

  cd "${srcdir}/${pkgbase}-${pkgver}"

  python setup.py install --root="${pkgdir}" -O1
  install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
