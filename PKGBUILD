# Maintainer: Kenneth Endfinger <kaendfinger@gmail.com>

pkgbase=django-rq
pkgname=('python-django-rq')
pkgver=2.3.0
pkgrel=1
pkgdesc="A simple app that provides django integration for RQ (Redis Queue)"
arch=('any')
license=('MIT')
url="https://github.com/ui/django-rq"
makedepends=('python' 'python-setuptools' 'python-django' 'python-rq')
source=("django-rq-${pkgver}.tar.gz::https://github.com/ui/django-rq/archive/v${pkgver}.tar.gz")
sha512sums=('8c1bc1f4306ca1202c4a4ba23fb4e59c72f9de6893912b7bb4eb943b51fc82a0f9be0cfd7774efdded6a882b3c82fc09ec60a9a6a58c9c3e24ae4af381f35596')

package_python-django-rq() {
  depends=('python' 'python-django' 'python-rq')

  cd "${srcdir}/${pkgbase}-${pkgver}"

  python setup.py install --root="${pkgdir}" -O1
  install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
