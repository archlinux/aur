# Maintainer: Jason McGillivray < mcgillivray dot jason at gmail dot com>


pkgname=py3status-amdfan
pkgdesc="Py3status module for monitoring fan and temp of amdgpu video cards"
pkgver=0.1.3
pkgrel=1
arch=('any')
license=('MIT')
depends=('python' 'py3status' 'amdfan')
makedepends=('python-setuptools')
url="https://github.com/mcgillij/py3status-amdfan"
source=("https://github.com/mcgillij/py3status-amdfan/releases/download/0.1.3/py3status-amdfan-0.1.3.tar.gz")
md5sums=('8e23ded33b240198aa6c4b391e49871d')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir"
}
