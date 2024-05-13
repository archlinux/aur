# Maintainer: Kenneth Endfinger <kaendfinger@gmail.com>

pkgbase=django-rq
pkgname=('python-django-rq')
pkgver=2.10.2
pkgrel=1
pkgdesc="A simple app that provides django integration for RQ (Redis Queue)"
arch=('any')
license=('MIT')
url="https://github.com/ui/django-rq"
makedepends=('python' 'python-setuptools' 'python-django' 'python-rq')
source=("django-rq-${pkgver}.tar.gz::https://github.com/ui/django-rq/archive/v${pkgver}.tar.gz")
sha512sums=('bc6d02db9c144b09cffd375322b9ff3adcb6970609968442066e1bc7755a5a33c6788d8573269749559af2d47c0829d798896951166e4385d6852520b4e28b94')

package_python-django-rq() {
  depends=('python' 'python-django' 'python-rq')

  cd "${srcdir}/${pkgbase}-${pkgver}"

  python setup.py install --root="${pkgdir}" -O1
  install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
