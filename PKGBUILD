# Maintainer: Tranquilo Chan <https://github.com/tttranquilooo>
pkgname=python-wonderful-bing
pkgver=0.10.0
pkgrel=1
pkgdesc="Set bing's picture as wallpaper, support cinnamon, gnome, xfce, mate"
arch=('any')
url="https://github.com/lord63/wonderful_bing"
license=('MIT')
depends=('python-docopt' 'python-requests')
makedepends=('python-setuptools')
source=("https://github.com/lord63/wonderful_bing/archive/v${pkgver}.tar.gz")
md5sums=('bd3efe4c6f75ec71ee5276298d073ac5')

build() {
  cd "$srcdir/wonderful_bing-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/wonderful_bing-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
