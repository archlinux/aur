# Maintainer: Nathan Lowe <techwiz96@gmail.com>
pkgname=python2-pyro3
pkgver=3.16
pkgrel=1
pkgdesc='Distributed object middleware for Python (RPC): Version 3'
url='https://github.com/irmen/Pyro4'
arch=('any')
license=('MIT')
depends=('python2')
source=("https://github.com/irmen/Pyro3/archive/$pkgver.tar.gz")
sha256sums=('858e592091f6e64d2ad988f0cdefd4836fa4eb3ef1080bf02039eb944c01033a')

package() {
  depends=('python2')

  cd "Pyro3-$pkgver"

  python2 setup.py install --root="$pkgdir"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
