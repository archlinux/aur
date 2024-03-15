# Maintainer: Khorne <khorne@khorne.me>
# Adapted from durdraw-git by: Kyle Keen <keenerd@gmail.com>
pkgname=durdraw
pkgver=0.26.0
pkgrel=1
pkgdesc="Frame based ASCII and ANSI drawing and playback program"
url="http://cmang.org/durdraw/"
license=('BSD-3-Clause')
arch=('any')
depends=('python' 'python-pillow' 'python-setuptools' 'python-importlib-metadata')
optdepends=('ansilove: png export, animated gif export')
source=("durdraw-"$pkgver".tar.gz::https://github.com/cmang/durdraw/archive/refs/tags/${pkgver}.tar.gz")
md5sums=('14388e0919ac4f47472a3c5e8be7dad7')

package() {
  cd ${pkgname}-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

