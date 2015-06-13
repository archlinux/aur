# Maintainer: Sebastien Leduc <sebastien@sleduc.fr>

pkgname=python2-pytvdbapi
_realname=pytvdbapi
pkgver=0.5.0
pkgrel=1
pkgdesc="A clean, resource friendly and easy to use Python API for thetvdb.com"
arch=(any)
url="https://github.com/fuzzycode/pytvdbapi"
license=('LGPL3')
depends=('python2' 'python2-httplib2')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/p/$_realname/$_realname-$pkgver.tar.gz")
md5sums=('0c603d02270f957d9e3887c27854d2d5')

package() {
  cd "$srcdir/$_realname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
