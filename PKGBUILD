# Maintainer: Simon Hanna <simon dot hanna AT serve-me DOT info>

pkgname=('python-social-auth' 'python2-social-auth')
_pkgbase='python-social-auth'
pkgver=0.2.12
pkgrel=1
pkgdesc="an easy-to-setup social authentication/registration mechanism with support for several frameworks and auth providers"
arch=(any)
url="https://github.com/omab/python-social-auth"
license=('BSD')
options=(!emptydirs)
install=
source=("https://github.com/omab/python-social-auth/archive/v${pkgver}.tar.gz")
sha256sums=('4c53208313d856ae30eb8554c66cab9d2c520405cfafeec93cea39f1a2ea8b97')


package_python-social-auth() {
  depends=('python-django')
  cd "$srcdir/$_pkgbase-$pkgver"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-social-auth() {
  depends=('python2-django')
  cd "$srcdir/$_pkgbase-$pkgver"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
