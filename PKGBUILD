# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=python-ebooklib
pkgver=0.17.1
pkgrel=1
pkgdesc='Python E-book library for handling books in EPUB2/EPUB3 format'
arch=('any')
url="https://ebooklib.readthedocs.io"
license=('AGPL3')
depends=('python-lxml'
         'python-six')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/aerkalov/ebooklib/archive/v${pkgver}.tar.gz")
sha256sums=('9de472d1a1e434d781cd7001c8e6b36d0fffe765d23b494afe7d26d8c34fda57')

package() {
  cd "ebooklib-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}