# Maintainer: Qiu Wenbo <crab2313@gmail.com>

pkgname=kas
pkgver=3.2.1
pkgrel=1
pkgdesc="Setup tool for bitbake based projects "
arch=(any)
url="https://github.com/siemens/kas"
license=('CUSTOM')
depends=('python' 'python-yaml' 'python-distro' 'python-jsonschema' 'python-kconfiglib')
optdepends=('libnewt: text based ui of menu plugin')
makedepends=('python-setuptools')
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/${pkgver}.tar.gz)
sha512sums=('28e027d9986e47fb61065c5e4440a8bc07861738ce31260dd1ab784ff27495fae03e577485b18d6a1e793e48dfea35075d31142cd76ce39895c80f7046c02022')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
