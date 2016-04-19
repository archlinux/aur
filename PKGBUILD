# Maintainer: Dan Elkouby <streetwalrus@codewalr.us>
pkgname=python-soco
pkgver=0.11.1
pkgrel=2
pkgdesc="A simple Python class that allows you to programmatically control Sonos speakers"
arch=('any')
url="https://github.com/SoCo/SoCo"
license=('MIT')
depends=('python' 'python-requests')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://github.com/SoCo/SoCo/archive/v$pkgver.tar.gz")
md5sums=('c0ff6775e70cea9cc26a01ad85a120ec')

package() {
  cd "$srcdir/SoCo-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE.rst "$pkgdir/usr/share/licenses/$pkgname/LICENSE.rst"
}

# vim:set ts=2 sw=2 et:
