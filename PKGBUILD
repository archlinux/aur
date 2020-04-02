# Contributor: jnanar <info@agayon.be>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=python-shortuuid
pkgver=1.0.1
pkgrel=2
pkgdesc="shortuuid is a simple python library that generates concise, unambiguous, URL-safe UUIDs."
arch=('any')
url="https://github.com/skorokithakis/shortuuid"
license=('custom:BSD')
depends=('python')
options=(!emptydirs)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/v$pkgver.tar.gz")
md5sums=('57fe99c8d16fa3c376e725963f8561a6')

package() {
  cd ${pkgname#python-}-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
