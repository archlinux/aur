# Maintainer: Khorne <khorne@khorne.me>
# Adapted from durdraw-git by: Kyle Keen <keenerd@gmail.com>
pkgname=durdraw
pkgver=0.25.3
pkgrel=1
pkgdesc="Frame based ASCII and ANSI drawing and playback program"
url="http://cmang.org/durdraw/"
license=('ISC')
arch=('any')
depends=('python' 'python-pillow' 'python-setuptools' 'python-importlib-metadata')
optdepends=('ansilove: png export, animated gif export')
source=("durdraw-"$pkgver".tar.gz::https://github.com/cmang/durdraw/archive/refs/tags/${pkgver}.tar.gz")
md5sums=('85827bce5e6b702da2a5d15385ecfffe')

package() {
  cd ${pkgname}-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

