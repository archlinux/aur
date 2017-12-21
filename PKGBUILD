# Maintainer: Franck Lucien Duriez <franck.lucien.duriez@gmail.com>
pythonpkgname="qifqif"
pkgname="python2-$pythonpkgname"
_srcname="$pkgname"
pkgver="0.7"
pkgrel="1"
pkgdesc="CLI tool to enrich your QIF files transactions with category information, hence cutting down import time from minutes to mere seconds."
arch=('any')
url="https://pypi.python.org/pypi/qifqif"
license=('MIT')
depends=('python2' 'python2-blessed' 'python2-ordereddict' 'python2-argparse')
makedepends=('python2-setuptools' 'pandoc')
source=("https://pypi.python.org/packages/c4/99/a66715e8205e36c2fd6c9ecd3a09133abd68d5da038e9808880473b894bb/$pythonpkgname-$pkgver.$pkgrel.tar.gz")
md5sums=('244d833af27187b58a1e6a5f5dec42ed')

package() {
  cd "${srcdir}/$pythonpkgname-$pkgver.$pkgrel"
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

