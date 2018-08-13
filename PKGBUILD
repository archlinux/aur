# Maintainer: Dan Elkouby <streetwalrus@codewalr.us>
pkgname=python-soco
pkgver=0.15
pkgrel=2
pkgdesc="A simple Python class that allows you to programmatically control Sonos speakers"
arch=('any')
url="https://github.com/SoCo/SoCo"
license=('MIT')
depends=('python' 'python-requests' 'python-xmltodict')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("SoCo-$pkgver.tar.gz::https://github.com/SoCo/SoCo/archive/v$pkgver.tar.gz")
md5sums=('fc4b95058befd8522783f558940a38c9')

package() {
  cd "$srcdir/SoCo-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE.rst "$pkgdir/usr/share/licenses/$pkgname/LICENSE.rst"
}

# vim:set ts=2 sw=2 et:
