# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=python-torchtext
_pkgname=torchtext
pkgver=0.2.1
pkgrel=1
pkgdesc='Data loaders and abstractions for text and NLP'
arch=(any)
url='https://github.com/pytorch/text'
license=(BSD)
depends=(python python-pytorch)
makedepends=(python-setuptools)
source=(https://pypi.python.org/packages/ef/d3/c55a49e18e18b6f752ce05e90f1264cfdcb17fa930c00d0d89628e27fff2/$_pkgname-$pkgver.tar.gz)
md5sums=(3d0d890e4ebe40fca1dafe59eae7d24e)
sha512sums=(25a62865eef0f2cf005501e2a866ee8d1a4832d1fa843bf8ae29be8e40fb6cfd61354539b44a97af01b800080dd8919f26a4803a680a25dbceff412c38705b9c)

package() {
  cd $srcdir/$_pkgname-$pkgver

  python setup.py install --root=$pkgdir --optimize=1
}
