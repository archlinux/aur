pkgname=swaytools
pkgver=0.1.0
pkgrel=1
pkgdesc='Quality of life tools for sway'
arch=('any')
url="https://github.com/tmccombs/swaytools"
license=('GPL3')
depends=('python' 'sway')
makedepends=('python-setuptools')
optdepends=('slurp: for swayinfo' 'bemenu: for winfocus' 'dmenu: for winfocus')
source=("https://github.com/tmccombs/swaytools/archive/$pkgver.tar.gz")

b2sums=('d1e94446590c702e69a45ab8d58c1067a83926d81f537f28b93eb3533d258451a2cacc675e98f6fcebb793f80d6a7de0cc413fb3e6de549199c6a5fb5f88b0c3')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
