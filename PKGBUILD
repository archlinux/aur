# Maintainer: Arif Roktim <arifrroktim at gmail dot com>
pkgname=mir.qualia
pkgver=1.0.0
pkgrel=1
pkgdesc="Automatically comment and uncomment config file sections"
arch=('any')
url="https://github.com/darkfeline/mir.qualia"
license=('Apache')
depends=('python' 'python-setuptools')
makedepends=()
source=('https://github.com/darkfeline/mir.qualia/archive/v1.0.0.tar.gz')
md5sums=('84943e0cb444d197c135504a33bca4df')

build() {
  cd "$pkgname-$pkgver"
  python3 setup.py build
}

check() {
  cd "$pkgname-$pkgver"
  python3 setup.py check
}

package() {
  cd "$pkgname-$pkgver"
  python3 setup.py install --single-version-externally-managed --optimize 01 --root="$pkgdir/" --prefix=/usr

}
