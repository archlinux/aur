# Maintainer:  charlie5 on #ada @ libera irc
# Contributor: Julian Leyh <julian@vgai.de>

pkgname=sphinxcontrib-adadomain
pkgver=26.1
pkgrel=1
pkgdesc="Adds Ada domain support to Sphinx."

arch=(any)
url=https://github.com/AdaCore/sphinxcontrib-adadomain
license=(BSD)
depends=(python-sphinx)
makedepends=(python-setuptools)

source=("git+$url.git#branch=26.1")
sha256sums=(SKIP)


package()
{
  cd $srcdir/$pkgname
  
  python setup.py install --root="$pkgdir/" --optimize=1
}
