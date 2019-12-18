# Maintainer: Tim Schumacher <timschumi@gmx.de>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=python-keyboard
pkgver=0.13.4
pkgrel=1
pkgdesc="Hook and simulate keyboard events on Windows and Linux"
arch=('any')
license=('MIT')
url="https://github.com/boppreh/keyboard"
depends=('python-setuptools')
source=("https://github.com/boppreh/keyboard/archive/v$pkgver.tar.gz")
sha512sums=('f03e994672ccea82f3934087ea5a4f96837e8eae48443d3bf4dd98ff8d2ad6da49b21888017445a28806074e47d066d9f428c783bb4f6c44d2c5d405c0dbfdd2')

build() {
  cd keyboard-$pkgver
  python setup.py build
}

package() {
  cd keyboard-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

