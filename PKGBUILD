Maintainer='Gilles Hamel <hamelg@laposte.net>'
pkgname=python2-whisper
pkgver=0.9.15
pkgrel=1
pkgdesc='Fixed-size database that provides fast, reliable storage of numeric data over time.'
arch=('any')
url='https://github.com/graphite-project/whisper'
license=('Apache')
groups=()
depends=('python2')
makedepends=('python2-setuptools')
options=(!emptydirs)
source=("https://github.com/graphite-project/whisper/archive/$pkgver.tar.gz")
md5sums=('73608453c46cfeb80edf30fae78f1851')

package() {
  cd "$srcdir/whisper-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et: