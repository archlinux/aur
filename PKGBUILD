# Maintainer: robertfoster

pkgname=python2-urlreader
_realname=URLReader
pkgver=0.0a1
pkgrel=1
pkgdesc="A simple Python package to download documents using HTTP"
arch=('any')
url="https://pypi.org/project/URLReader/"
license=('GPL')
depends=('python2')
provides=("$pkgbase=$pkgver")
source=(https://files.pythonhosted.org/packages/f0/2a/164a5671cc01f315694a3e1e9cc4f36d17f3d25e3ca4d0ab8e3d8fa0e69e/URLReader-$pkgver.tar.gz)

build() {
  cd $_realname-$pkgver
  python2 setup.py build
}

package() {
  cd $_realname-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1
}

md5sums=('5a96519a24099aae05fc0612d9cfd650')
