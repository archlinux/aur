# Maintainer: Sebastien Leduc <sebastien@sleduc.fr>
pkgname=python2-trollius
_realname=trollius
pkgver=1.0.4
pkgrel=2
pkgdesc="Port of the Tulip project (asyncio module, PEP 3156) on Python 2.7"
arch=("any")
url="https://bitbucket.org/enovance/trollius"
license=('APACHE')
depends=('python2' 'python2-futures')
source=("http://pypi.python.org/packages/source/t/$_realname/$_realname-$pkgver.tar.gz")
md5sums=('3631a464d49d0cbfd30ab2918ef2b783')

package() {
  cd "$srcdir/$_realname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
