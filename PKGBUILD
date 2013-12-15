# Maintainer: mutantmonkey <aur@mutantmonkey.in>
pkgname=python-socksipy-branch
pkgver=1.01
pkgrel=1
pkgdesc="A module for using the Twilio REST API and generating valid TwiML."
arch=('any')
url="http://code.google.com/p/socksipy-branch/"
license=('BSD')
depends=('python')
options=(!emptydirs)
source=("http://socksipy-branch.googlecode.com/files/SocksiPy-branch-${pkgver}.tar.gz")
sha256sums=('8331732ed0fcacc84e7c33c07f5e3902f0869a215b3a56f0a8845d2fafbfd504')

package() {
  cd "$srcdir/SocksiPy-branch-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
