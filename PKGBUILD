# Maintainer:  charlie5 on #ada @ libera irc
# Contributor: Julian Leyh <julian@vgai.de>

pkgname=sphinxcontrib-adadomain
pkgver=0.6
pkgrel=1
pkgdesc="Adds Ada domain support to Sphinx."

arch=(any)
url=https://github.com/AdaCore/sphinxcontrib-adadomain
license=(BSD)
depends=(python-sphinx)
makedepends=(python-setuptools)

source=($url/archive/refs/heads/master.zip)
sha256sums=(eee7e9e080ef9df2958166c234b38fa9336e035e2e8baa9239a7b216946272ac)


package()
{
  cd $srcdir/$pkgname-master
  python setup.py install --root="$pkgdir/" --optimize=1
}
