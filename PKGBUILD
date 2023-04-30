# Maintainer:  charlie5 on #ada @ libera irc
# Contributor: Julian Leyh <julian@vgai.de>

pkgname=sphinxcontrib-adadomain
pkgver=0.4
pkgrel=1
pkgdesc="Adds Ada domain support to Sphinx."
arch=('any')
url="https://github.com/AdaCore/sphinxcontrib-adadomain"
license=('BSD')
depends=('python-sphinx')
makedepends=('python-setuptools')

source=("$url/archive/refs/heads/master.zip")
sha256sums=('133d82b04eb496a1a0cdbef6edbbe1fd12a87bfcad2fa59bdafcc97a99fc33dd')

package()
{
  cd "$srcdir/$pkgname-master"
  python setup.py install --root="$pkgdir/" --optimize=1
}
