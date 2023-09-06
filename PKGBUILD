# Maintainer: Khorne <khorne@khorne.me>
# Adapted from durdraw-git by: Kyle Keen <keenerd@gmail.com>
pkgname=durdraw
pkgver=0.21.0
pkgrel=1
pkgdesc="Frame based ASCII and ANSI drawing and playback program"
url="http://cmang.org/durdraw/"
license=("custom")
arch=('any')
depends=('python' 'python-pillow' 'python-setuptools')
optdepends=('ansilove: png export, animated gif export')
source=("durdraw-"$pkgver".tar.gz::https://github.com/cmang/durdraw/archive/refs/tags/${pkgver}.tar.gz")
md5sums=('49beb5c8dcefc9d5398aab07c40b0a18')

package() {
  cd ${pkgname}-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1
}

