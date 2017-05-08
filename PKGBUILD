# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=python-asyncthreads
pkgver=1.5.4
pkgrel=1
pkgdesc="."
url="https://github.com/chrisallenlane/cheat"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://pypi.python.org/packages/15/41/cf515306b73a20062b2623d2c5c3921194c1af195f0fb077367b35b2b898/asyncthreads-1.5.4.tar.bz2#md5=ed7c4c659b7494a6ff0fa7869fcaa88b")
sha256sums=('200b0dbc7dae8cf472cfff593d366cb87c27257dec4cd587c03f4d0383acf25e')

build() {
  cd "$srcdir/asyncthreads-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/asyncthreads-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
