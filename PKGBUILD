# Maintainer:  charlie5 on #ada @ libera irc
# Contributor: Julian Leyh <julian@vgai.de>

pkgname=sphinxcontrib-adadomain
pkgver=0.6
pkgrel=2
pkgdesc="Adds Ada domain support to Sphinx."

arch=(any)
url=https://github.com/AdaCore/sphinxcontrib-adadomain
license=(BSD)
depends=(python-sphinx)
makedepends=(python-setuptools)

source=($url/archive/refs/heads/master.zip)
sha256sums=(b214093cdc78e8d426e217aab5e576c033f99549457c14cfc0b9bbb49e5ce4cb)


package()
{
  cd $srcdir/$pkgname-master
  python setup.py install --root="$pkgdir/" --optimize=1
}
