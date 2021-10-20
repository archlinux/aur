# Maintainer: Tim Schumacher <timschumi@gmx.de>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=python-unicode-slugify
pkgver=0.1.5
pkgrel=1
pkgdesc="A slug generator that turns strings into unicode slugs."
arch=('any')
license=('BSD')
url="http://github.com/mozilla/unicode-slugify"
depends=('python-setuptools' 'python-six' 'python-unidecode')
source=("https://pypi.io/packages/source/u/unicode-slugify/unicode-slugify-$pkgver.tar.gz")
sha512sums=('69cf66a91264647aa551996e84952ebf6b5a31b88783c657f2857265bf52fbc1bc52ba832e092862c56ab13967505e98db192e03e1d3932829c923ee30c483e8')

build() {
  cd unicode-slugify-$pkgver
  python setup.py build
}

package() {
  cd unicode-slugify-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

