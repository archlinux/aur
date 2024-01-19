# Maintainer: Tim Schumacher <timschumi@gmx.de>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=python-keyboard
pkgver=0.13.5
pkgrel=1
pkgdesc="Hook and simulate keyboard events on Windows and Linux"
arch=('any')
license=('MIT')
url="https://github.com/boppreh/keyboard"
depends=('python3')
makedepends=('python-setuptools')
source=("https://github.com/boppreh/keyboard/archive/v$pkgver.tar.gz")
sha512sums=('cea0945671a83a0be411801c6bf90c94eb37036dd232e9cf46700aff49f3e23800b93292bcf1b108c558c9c3179dd01d73796b21916e0bed7e5a2407f9c8f094')

build() {
  cd keyboard-$pkgver
  python setup.py build
}

package() {
  cd keyboard-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

