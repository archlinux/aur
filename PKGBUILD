# Maintainer:  charlie5 on #ada @ libera irc
# Contributor: Julian Leyh <julian@vgai.de>

pkgname=sphinxcontrib-adadomain
pkgver=0.3
pkgrel=3
pkgdesc="Adds Ada domain support to Sphinx."
arch=('any')
url="https://github.com/AdaCore/sphinxcontrib-adadomain"
license=('BSD')
depends=('python-sphinx')
makedepends=('python-setuptools')

source=("$url/archive/refs/heads/master.zip")
sha256sums=('fe0b99607ee224482d3a967b27d7c1d59dfd4c9085919aa0a5a8146c44ca3c1e')

package()
{
  cd "$srcdir/$pkgname-master"
  python setup.py install --root="$pkgdir/" --optimize=1
}
