# Maintainer: Axilleas Pipinellis <axilleas archlinux info>

pkgname=python2-commando
pkgver=1.0.0
pkgrel=1
pkgdesc="A declarative interface for argparse"
arch=('any')
url='http://github.com/lakshmivyas/commando'
license=('MIT')
makedepends=('python2' 'python2-distribute')
source=("https://pypi.python.org/packages/source/c/commando/commando-$pkgver.tar.gz")

package() {
  cd "${srcdir}"/commando-"$pkgver"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  python2 setup.py install --root="${pkgdir}" -O1
}

md5sums=('0ba5d7c211dfa1c8e53ff99e08f33bac')
