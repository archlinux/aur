# Maintainer: SanskritFritz (gmail)

pkgname=quikey
pkgver=0.1.4
pkgrel=1
pkgdesc="A keyboard macro tool."
arch=('any')
url="https://github.com/bostrt/quikey"
license=('MIT')
depends=('python-click' 'python-colored' 'python-daemon' 'python-inotify-simple' 'python-tinydb' 'python-pynput' 'python-terminaltables' 'python-xdg' 'python-humanize' 'python-pick')
makedepends=('python-setuptools')
source=("https://github.com/bostrt/quikey/archive/$pkgver.tar.gz")
md5sums=('8840db5553e6365ddace8754cb25946f')

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root=$pkgdir --optimize=1
}

# vim:set ts=2 sw=2 et:
