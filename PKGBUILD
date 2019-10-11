# Maintainer: SanskritFritz (gmail)

pkgname=quikey
pkgver=0.0.9
pkgrel=1
pkgdesc="A keyboard macro tool."
arch=('any')
url="https://github.com/bostrt/quikey"
license=('MIT')
depends=('python-click' 'python-colored' 'python-daemon' 'python-inotify-simple' 'python-tinydb' 'python-pynput' 'python-terminaltables' 'python-xdg' 'python-humanize')
makedepends=('python-setuptools')
source=("https://github.com/bostrt/quikey/archive/$pkgver.tar.gz")
md5sums=('ff70c0fc35d29917ccdef6dc3d44dc84')

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root=$pkgdir --optimize=1
}

# vim:set ts=2 sw=2 et:
