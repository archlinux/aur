# Maintainer: Trougnouf (Benoit Brummer) <trougnouf@gmail.com>
# Contributor: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>

pkgname=python2-itsdangerous
pkgver=1.1.0
pkgrel=1
pkgdesc='Various helpers to pass trusted data to untrusted environments'
arch=('any')
url="http://pypi.python.org/pypi/itsdangerous"
license=('BSD')
depends+=('python2')
makedepends=('python2' 'python2-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mitsuhiko/itsdangerous/archive/${pkgver}.tar.gz")
sha256sums=('2fbc62987b9f7aa646083326e5746ab5d791628e63575851a8ce5d5d5e8754b9')

package() {
  cd "itsdangerous-$pkgver"

  python2 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE.rst "$pkgdir/usr/share/licenses/$pkgname/LICENSE.rst"
}

# vim:set ts=2 sw=2 et:
