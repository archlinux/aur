_name=asciitree
pkgname=python2-$_name
pkgver=0.3.1
pkgrel=1
pkgdesc="draws tree structures using characters."
arch=('any')
url="http://github.com/mbr/asciitree"
license=('MIT')
depends=('python2')
options=(!emptydirs)
source=("http://github.com/mbr/$_name/archive/$pkgver.tar.gz")
md5sums=('5f34f6f32fda90eb30df3ee6ccfa4494')

package() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
