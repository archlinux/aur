# Contributor: jnanar <info@agayon.be>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=python-shortuuid
pkgver=1.0.2
pkgrel=1
pkgdesc="shortuuid is a simple python library that generates concise, unambiguous, URL-safe UUIDs."
arch=('any')
url="https://github.com/skorokithakis/shortuuid"
license=('custom:BSD')
depends=('python')
options=(!emptydirs)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/v$pkgver.tar.gz")
md5sums=('4f4754915c998e2e958ba5c1012c6ab8')

package() {
  cd ${pkgname#python-}-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
