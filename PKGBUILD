# Maintainer: S.Leduc <sebastien@sleduc.fr>

pkgname=python-grapevine
_realname=grapevine
pkgver=1.0
pkgrel=1
pkgdesc="Iterator pipelines for Python"
arch=("any")
url="http://jwilk.net/software/python-grapevine"
license=('MIT')
depends=('python')
source=("https://pypi.python.org/packages/source/g/$_realname/$_realname-$pkgver+py3k.tar.gz")
md5sums=('5db4fcac854b4919abe22da8f1eb9cdb')

package() {
  cd "$srcdir/$_realname-$pkgver+py3k"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
