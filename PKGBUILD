# Maintainer: Dan Elkouby <streetwalrus@codewalr.us>
pkgname=python-soco
pkgver=0.14
pkgrel=2
pkgdesc="A simple Python class that allows you to programmatically control Sonos speakers"
arch=('any')
url="https://github.com/SoCo/SoCo"
license=('MIT')
depends=('python' 'python-requests' 'python-xmltodict')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("SoCo-$pkgver.tar.gz::https://github.com/SoCo/SoCo/archive/v$pkgver.tar.gz")
md5sums=('79aa50653e9f1bc334026b63767f37af')

package() {
  cd "$srcdir/SoCo-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE.rst "$pkgdir/usr/share/licenses/$pkgname/LICENSE.rst"
}

# vim:set ts=2 sw=2 et:
