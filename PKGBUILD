# Maintainer: SanskritFritz (gmail)

pkgname=quikey
pkgver=0.1.1
pkgrel=1
pkgdesc="A keyboard macro tool."
arch=('any')
url="https://github.com/bostrt/quikey"
license=('MIT')
depends=('python-click' 'python-colored' 'python-daemon' 'python-inotify-simple' 'python-tinydb' 'python-pynput' 'python-terminaltables' 'python-xdg' 'python-humanize')
makedepends=('python-setuptools')
source=("https://github.com/bostrt/quikey/archive/$pkgver.tar.gz")
md5sums=('8dc7d0541e7a8099e62cb126ef31e76c')

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root=$pkgdir --optimize=1
}

# vim:set ts=2 sw=2 et:
