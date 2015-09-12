# Maintainer: Simon Hanna <simon dot hanna AT serve-me DOT info>

pkgname=('python-django-appconf' 'python2-django-appconf')
_pkgbase='django-appconf'
pkgver=1.0.1
pkgrel=1
pkgdesc="A helper class for handling configuration defaults of packaged Django apps gracefully"
arch=(any)
url="https://github.com/jezdez-archive/django-appconf"
license=('BSD')
options=(!emptydirs)
install=
source=("https://github.com/jezdez-archive/django-appconf/archive/v${pkgver}.tar.gz")
sha256sums=('1574e5cbdc402d5e8e7b078513c1083a168c746282e50c06fbe10c98f97aee89')


package_python-django-appconf() {
  depends=('python-django' 'python-six')
  cd "$srcdir/$_pkgbase-$pkgver"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-django-appconf() {
  depends=('python2-django' 'python2-six')
  cd "$srcdir/$_pkgbase-$pkgver"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
