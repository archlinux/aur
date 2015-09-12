# Maintainer: Simon Hanna <simon dot hanna AT serve-me DOT info>

pkgname=('python-django-paintstore' 'python2-django-paintstore')
_pkgbase='django-paintstore'
pkgver=0.1
pkgrel=1
pkgdesc="Integrates jQuery ColorPicker with the Django admin"
arch=(any)
url="https://github.com/gsiegman/django-paintstore"
license=('MIT')
options=(!emptydirs)
source=("https://github.com/gsiegman/django-paintstore/archive/${pkgver}.tar.gz")
sha256sums=('d5f37d174ec5f25cde7602f42eb86bd607108b13130b7a44257548452a9a5c85')
makedepends=('python-setuptools' 'python2-setuptools')

package_python-django-paintstore() {
  depends=('python-django')
  cd "$srcdir/$_pkgbase-$pkgver"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-django-paintstore() {
  depends=('python2-django')
  cd "$srcdir/$_pkgbase-$pkgver"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
