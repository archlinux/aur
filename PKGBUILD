# Maintainer: Alexander Phinikarides, <alexisph at gmail dot com>

pkgname=python-blockdiagcontrib-cisco
pkgver=0.1.8
pkgrel=2
pkgdesc="A plugin for blockdiag that provides shapes for networking"
arch=("any")
url="https://pythonhosted.org/blockdiagcontrib-cisco/"
license=('PSL')
depends=('python' 'blockdiag')
source=("https://pypi.python.org/packages/c0/cd/578d3c267e57d57c1e0969b0f5ba9648cf68dd343eb96fcce4d5b67444e7/blockdiagcontrib-cisco-$pkgver.tar.gz")
md5sums=('636bfc9d71625d7d5e50e88f14ebce1e')

build() {
  cd "$srcdir/blockdiagcontrib-cisco-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/blockdiagcontrib-cisco-$pkgver"
  python setup.py install --skip-build --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
