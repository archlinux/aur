# Maintainer: robertfoster

pkgname=python2-getmediumurl
_realname=GetMediumURL
pkgver=0.0a5
pkgrel=1
pkgdesc="A simple Python package to get URLs of downloadable media"
arch=('any')
url="https://pypi.org/project/URLReader/"
license=('GPL')
depends=('python2' 'python2-urlreader')
source=("https://files.pythonhosted.org/packages/ec/34/607e05152ec7850e69ca68e70293b7926ac86a20a58569cef493bb23a7cc/${_realname}-$pkgver.tar.gz")

build() {
  cd $_realname-$pkgver
  python2 setup.py build
}

package() {
  cd $_realname-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1
}

md5sums=('0d3660e178bd58549d7a5718f8e39de2')
