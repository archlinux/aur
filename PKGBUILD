# Contributor: jnanar <info@agayon.be>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=python-shortuuid
pkgver=1.0.1
pkgrel=1
pkgdesc="shortuuid is a simple python library that generates concise, unambiguous, URL-safe UUIDs."
arch=('any')
url="https://github.com/skorokithakis/shortuuid"
license=('BSD')
depends=('python')
options=(!emptydirs)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/v$pkgver.tar.gz")
md5sums=('SKIP')

package() {
  cd ${pkgname#python-}-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1
}
