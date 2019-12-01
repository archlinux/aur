# Maintainer: Simon Hanna <simon dot hanna AT serve-me DOT info>

pkgname=('python2-django-gravatar')
pkgver=1.4.0
pkgrel=1
pkgdesc="Includes helper methods for interacting with gravatars outside of template code"
arch=(any)
url="https://github.com/twaddington/django-gravatar"
license=('MIT')
options=(!emptydirs)
source=("https://github.com/twaddington/django-gravatar/archive/${pkgver}.tar.gz")
sha256sums=('849a4ffdb99c333f69709a54bccc12dd266e1db7a8f352eb0ebcc97e65161782')
makedepends=('python2-setuptools')

package_python2-django-gravatar() {
  depends=('python2-django')
  cd "$srcdir/django-gravatar-$pkgver"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
