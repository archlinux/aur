# Maintainer: Simon Hanna <simon dot hanna AT serve-me DOT info>

pkgname=('python-django-gravatar' 'python2-django-gravatar')
_pkgbase='django-gravatar'
pkgver=1.3.0
pkgrel=1
pkgdesc="Includes helper methods for interacting with gravatars outside of template code"
arch=(any)
url="https://github.com/twaddington/django-gravatar"
license=('MIT')
options=(!emptydirs)
install=
source=("https://github.com/twaddington/django-gravatar/archive/${pkgver}.tar.gz")
sha256sums=('b557e25748585647df3774727f2183117691bde1236f3054117e35f66c66f88c')


package_python-django-gravatar() {
  depends=('python-django')
  cd "$srcdir/$_pkgbase-$pkgver"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-django-gravatar() {
  depends=('python2-django')
  cd "$srcdir/$_pkgbase-$pkgver"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
