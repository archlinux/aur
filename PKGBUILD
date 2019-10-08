# Maintainer: Tim Schumacher <timschumi@gmx.de>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=python-unicode-slugify
pkgver=0.1.3
pkgrel=1
pkgdesc="A slug generator that turns strings into unicode slugs."
arch=('any')
license=('BSD')
url="http://github.com/mozilla/unicode-slugify"
depends=('python-setuptools' 'python-six' 'python-unidecode')
source=("https://pypi.io/packages/source/u/unicode-slugify/unicode-slugify-$pkgver.tar.gz")
sha512sums=('509414c8b3603f3b092390ee29f52b6a22de45d904fcfa5554f2c1188a35ac090781050642b0b7bf068d1b30ce424342878e646db98b592712f47595528911a1')

build() {
  cd unicode-slugify-$pkgver
  python setup.py build
}

package() {
  cd unicode-slugify-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

