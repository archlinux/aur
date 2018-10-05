# Maintainer:  charlie5 on #ada @ freenode
# Contributor: Julian Leyh <julian@vgai.de>

pkgname=sphinxcontrib-adadomain
pkgver=0.2
pkgrel=1
pkgdesc="Adds Ada domain support to Sphinx."
arch=('any')
url="https://bitbucket.org/tkoskine/sphinxcontrib-adadomain"
license=('BSD')
depends=('python2-sphinx')
source=(https://files.pythonhosted.org/packages/6d/eb/e7b774c4c254236fdb86fcb743f5d123abda5f3de90050952cb00ce0b54d/sphinxcontrib-adadomain-0.2.tar.gz)
sha256sums=('42bb33aa4adcd43ff6b43a3fe7b305428abd8dfb7a76b1dc44a5392c5359ed76')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
